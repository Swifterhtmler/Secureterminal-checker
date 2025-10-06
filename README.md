
# Secureterminal

Secureterminal is a command line extension made for zsh-shells. It checks the security of the commands you give it and gives an answer on how safe it is to run this command on HIGH,MEDIUM,LOW scale.


## Features

- Fast
- Local
- Small
- Easy to use




## Use

Make sure you have ollama andthe model llama3.2 installed before running.

Then just simply run

```bash
comch ls -a
```

or

```bash
comch rm -r Library
````

or any command you want:

```bash
comch <your_command>
````

and it gives you the grade on how dangerous the command is on HIGH,MEDIUM or LOW scale.

```bash
comch -m llama3.2 ls
````
Uses specific model

```bash
 comch -l
````

lists all models

```bash
 comch -u "<text-containing-user-name>"
````

This removes all instances of username from the input and prints the output without username, replacing them with generic place holder.



```bash
  comch -e "ls -a"
````

Gives the user the explanation on why the risk level is LOW,MEDIUM,HIGH and what is behind that ranking.

## Installation

Install the project by

```bash
  git clone https://github.com/Swifterhtmler/Secureterminal-checker.git
  cd Secureterminal-checker
```

Then move it to your oh-my-zsh plugins folder and then reload your /.zshrc file by using:

```bash
source ~/.zshrc 
```




    
## Tech Stack

**Client:** ZSH, Ollama




## Authors

- [Swifterhtmler](https://www.github.com/swifterhtmler)

