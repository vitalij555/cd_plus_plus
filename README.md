# cd++

Effortlessly manage and navigate your folders with `cd++`. This bash script allows you to create custom labels for your directories, enabling you to switch between them using simple label-based commands.

## Motivation

Whether you're juggling multiple projects simultaneously, dealing with a complex folder structure, or any other scenario that requires frequent directory navigation, `cd++` offers a solution. With it, you can label your frequently visited folders and later access them with a straightforward command, `go label-name`.

### Example

Consider the following folder structure:

```bash
WORKS
├── apple
├── banana
└── strawberry
```

To navigate this structure with ease:


1. First, label the directories of interest. You can even assign multiple labels to a single directory:


```bash
/tmp$ cd WORKS
/tmp/WORKS$ mark works
/tmp/WORKS$ cd apple
/tmp/WORKS/apple$ mark apple
/tmp/WORKS/apple$ cd ../banana
/tmp/WORKS/banana$ mark banana
/tmp/WORKS/banana$ cd ../strawberry/
/tmp/WORKS/strawberry$ mark strawberry   # Multiple labels
/tmp/WORKS/strawberry$ mark strwbry      # for the same directory
/tmp/WORKS/strawberry$ mark berry        # are supported
```

    
2. Use the go command to navigate seamlessly:



```bash
/tmp$ go banana
/tmp/WORKS/banana$ 
/tmp/WORKS/banana$ go work
Error: Label not found.
/tmp/WORKS/banana$ go works
/tmp/WORKS$ 
/tmp/WORKS$ mark work  # add new labels any time you want
/tmp/WORKS$ 
/tmp/WORKS$ go berry
/tmp/WORKS/strawberry$ go work
/tmp/WORKS$ go apple
/tmp/WORKS/apple$ 

```


With cd++, your directory navigation becomes efficient and intuitive.


### Installation Instructions

#### Prerequisites:

- Ensure you have the necessary permissions to copy files to /usr/local/bin and to modify your shell's configuration file (like .bashrc, .zshrc, etc.).

#### Steps:

1. Clone the Repository:

    ```bash
    git clone https://github.com/vitalij555/cd_plus_plus.git
    cd cd-plus-plus
    ```

2. Run the Installation Script:

    ```bash
    chmod +x install.sh
    ./install.sh
    ```

    During the installation, you will be prompted:


    ```bash
    Do you want to install the command extensions as well? (yes/NO):
    ```

    If you wish to also install the command extensions, type `yes` and press `Enter`. Otherwise, simply press `Enter` to continue without installing them.

    
3. Restart your Shell:

    This ensures that the changes are applied. Alternatively, you can manually source your shell configuration file:

    - For Bash: `. ~/.bashrc`

    - For Zsh: `. ~/.zshrc`

    - For Fish: `source ~/.config/fish/config.fish`

    - ...and so on for other shells.


#### Verification:

After installation, you can test the functionality:

- For the main script:

    ```bash
    mark test
    ```

    This should save the current directory with the label "test".

- If you installed the command extensions:

    ```bash
    ls #test
    ```

    This should list the contents of the directory you just saved under the label "test".