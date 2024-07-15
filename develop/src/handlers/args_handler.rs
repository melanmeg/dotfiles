use crate::handlers::cmd_handler::run_cmd;
use std::{env, fs};

pub fn clear_bash_dotfiles(clear_flag: bool) {
    if clear_flag {
        println!("clear dotfiles...");
        run_cmd(
            r#"rm -vf $HOME/.bash_history $HOME/.bashrc $HOME/.profile $HOME/.viminfo"#,
            true,
        );
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
    let script_file_path = env::current_exe().expect("Failed to get exe file");
    let script_dir = script_file_path
        .parent()
        .expect("Failed to get exe directory");
    let dotdir = script_dir.parent().expect("Failed to get dot directory");
    let home_dir = dirs::home_dir().expect("Failed to get home directory");
    let entries = fs::read_dir(dotdir).expect("Failed to read directory");

    for entry in entries {
        if let Ok(entry) = entry {
            let file_name = entry.file_name();
            let file_path = entry.path();

            // Skip .git directory
            if file_name.to_str() == Some(".git")
                || file_name.to_str() == Some(".github")
                || file_name.to_string_lossy() == "develop"
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
                    run_cmd(&cmd, false);
                } else {
                    println!("copy to homedir {}...", dest_path.display());
                    let cmd = format!(
                        "cp -va {} {}",
                        file_path.to_string_lossy(),
                        home_dir.to_string_lossy()
                    );
                    run_cmd(&cmd, false);
                }
            } else {
                println!(" already exist {}...", dest_path.display());
            }
        }
    }
}
