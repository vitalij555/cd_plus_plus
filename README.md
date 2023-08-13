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

