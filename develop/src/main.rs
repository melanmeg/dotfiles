mod handlers;

use clap::Parser;
use handlers::args_handler::*;
use handlers::cmd_handler::run_cmd;

#[derive(Debug, Parser)]
#[command(version, about, long_about = None)]
struct Args {
    /// Clear dotfiles
    #[arg(short, long)]
    clear: bool,
    /// Backup dotfiles
    #[arg(short, long)]
    backup: bool,
    /// Link to homedir
    #[arg(short, long)]
    link: bool,
}

fn main() {
    let args = Args::parse();
    install_handler(args);
}

fn install_handler(args: Args) {
    create_dotbackup(args.backup);
    clear_dotfiles(args.clear);
    link_to_homedir(args.backup, args.link);
    println!("");
    run_cmd(
        "git config --global include.path ~/.gitconfig_shared",
        true,
        Some(&true),
    );
    println!("");
    run_cmd(r#"echo -e \e[1;36m Install completed!!!! \e[m"#, true, None);
}
