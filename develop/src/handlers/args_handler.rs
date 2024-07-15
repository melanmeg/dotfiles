use crate::handlers::cmd_handler::run_cmd;
use std::path::PathBuf;
use std::process::Command;
use std::{env, fs};

struct Context {
    home_dir: PathBuf,
    entries: fs::ReadDir,
}

impl Context {
    fn new() -> Result<Self, String> {
        let script_file_path =
            env::current_exe().map_err(|e| format!("Failed to get exe file: {}", e))?;
        let script_dir = script_file_path
            .parent()
            .ok_or("Failed to get exe directory")?
            .to_path_buf();
        let dotdir = script_dir
            .parent()
            .ok_or("Failed to get dot directory")?
            .to_path_buf();
        let home_dir = dirs::home_dir().ok_or("Failed to get home directory")?;
        let entries =
            fs::read_dir(&dotdir).map_err(|e| format!("Failed to read directory: {}", e))?;

        Ok(Context { home_dir, entries })
    }
}

pub fn clear_bash_dotfiles(clear_flag: bool) {
    let context = match Context::new() {
        Ok(context) => context,
        Err(err) => {
            eprintln!("Error creating context: {}", err);
            return;
        }
    };
    let home_dir = context.home_dir;

    if clear_flag {
        println!("clear dotfiles...");
        let command = Command::new("rm")
            .arg("-vrf")
            .arg(format!("{}/.*", home_dir.to_str().unwrap()))
            .output();
        match command {
            Ok(output) => {
                if output.status.success() {
                    let stdout = String::from_utf8_lossy(&output.stdout);
                    println!("Command executed successfully!\n{}", stdout);
                } else {
                    let stderr = String::from_utf8_lossy(&output.stderr);
                    eprintln!("Command failed: {}", stderr);
                }
            }
            Err(e) => {
                eprintln!("Failed to execute command: {}", e);
            }
        }
    }
}

pub fn create_dotbackup(backup_flag: bool) {
    if backup_flag {
        println!("backup dotfiles...");
        let dotbackup_dir = format!("{}/.dotbackup", std::env::var("HOME").unwrap_or_default());
        if !std::path::Path::new(&dotbackup_dir).exists() {
            println!("{} not found. Auto Make it.", dotbackup_dir);
            if let Err(err) = fs::create_dir(&dotbackup_dir) {
                eprintln!("Failed to create directory: {}", err);
            }
        } else {
            println!("{} already exists.", dotbackup_dir);
        }
    }
}

pub fn link_to_homedir(backup_flag: bool, link_flag: bool) {
    println!("install dotfiles to homedir...");
    let context = match Context::new() {
        Ok(context) => context,
        Err(err) => {
            eprintln!("Error creating context: {}", err);
            return;
        }
    };
    let entries = context.entries;
    let home_dir = context.home_dir;

    for entry in entries {
        if let Ok(entry) = entry {
            let file_name = entry.file_name();
            let file_path = entry.path();

            // Skip .git directory
            if file_name.to_str() == Some(".git")
                || file_name.to_str() == Some(".github")
                || !file_name.to_string_lossy().starts_with('.')
            {
                continue;
            }

            let dest_path = home_dir.join(&file_name);
            if backup_flag && dest_path.exists() {
                println!("dotbackup {}...", dest_path.display());
                fs::rename(&dest_path, home_dir.join(".dotbackup").join(&file_name))
                    .expect("Failed to move file to backup");
            }

            if !dest_path.exists() {
                if link_flag {
                    println!("link to homedir {}...", dest_path.display());
                    let cmd = format!(
                        "ln -vsnf {} {}",
                        file_name.to_string_lossy(),
                        home_dir.to_string_lossy()
                    );
                    run_cmd(&cmd, false, None);
                } else {
                    println!("copy to homedir {}...", dest_path.display());
                    let cmd = format!(
                        "cp -va {} {}",
                        file_path.to_string_lossy(),
                        home_dir.to_string_lossy()
                    );
                    run_cmd(&cmd, false, None);
                }
            } else {
                println!(" already exist {}...", dest_path.display());
            }
        }
    }
}
