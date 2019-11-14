# Purescript React Starter
Best practices for using React with Purescript

## How to get started

1. Install NodeJS from https://nodejs.org/

2. Install an Editor.

  - I recommend Spacemacs - https://www.spacemacs.org
  - You can also use VSCode - https://code.visualstudio.com
  
3. Setup Purescript editor support.

  - Spacemacs
    - Add `(purescript :variables node-add-modules-path t)` to the layers in your `.spacemacs` configuration file.
    
  - VSCode
    - Install `Purescript IDE` package by Nicholas Wolverson.
    - Go to `Settings > Purescript Configuration`. Set the following -
      - Enable `Add Npm Path`
      - Enable `Add Spago Sources`
      - Change the Build command to `spago build -- --json-errors`

2. Clone this repository -

```
λ git clone https://github.com/ajnsit/purescript-react-starter myrepo
λ cd myrepo
```

3. Setup the prerequisites -

```
λ npm install
```

This will install purescript and other tools *locally* into the project directory.

4. Build the Purescript code -

```
λ spago build
```

5. Open the folder in your editor and start coding!
