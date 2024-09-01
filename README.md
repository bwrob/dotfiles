# dotfiles

This repository holds my personal dotfiles, which are configuration files for various applications and tools on my Linux system. These files are managed using the `stow` tool to ensure proper linking and organization.

**Requirements:**

* Ubuntu Linux system
* Zsh shell
* `stow` package installed (`sudo apt install stow`)

**Usage:**

1. **Clone the repository:**

   ```bash
   git clone <your-repo-url> ~/.dotfiles
   ```

2. **Install dotfiles:**

   ```bash
   cd ~/.dotfiles
   stow -v -R *
   ```

**Configuration:**

* **zshrc:** The primary configuration file for Zsh. Customize it to your preferences.
* **aliases:** A file containing custom shell aliases.
* **vscode-settings.json:** Configuration settings for Visual Studio Code.
* **[other-config-files]:** Additional configuration files as needed.

**Updating dotfiles:**

1. **Pull changes from the remote repository:**

   ```bash
   cd ~/.dotfiles
   git pull
   ```

2. **Update links using `stow`:**

   ```bash
   stow -v -R *
   ```

**Uninstalling dotfiles:**

1. **Remove links using `stow`:**

   ```bash
   stow -v -R --delete *
   ```

2. **Delete the repository:**

   ```bash
   rm -rf ~/.dotfiles
   ```

**Note:**

* For more information on `stow`, refer to the official documentation: [https://gist.github.com/andreibosco/cb8506780d0942a712fc](https://gist.github.com/andreibosco/cb8506780d0942a712fc)
* You can customize the repository structure and configuration files to fit your specific needs.
* Consider using a version control system like Git to track changes and manage your dotfiles effectively.
