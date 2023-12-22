
function introMessage() {
  echo "Today is " date

# First paramater "$1" is the project name, ie: "sampleProject";
# Package manager "$2", ie: npm, pnpm, yarn, bun.
# Second paramater "$3" is the scripting language file type, ie: "js", "ts".
# Third paramater "$4" is the styles" file type, ie: "css", "scss", "sass", "less".


}


# First paramater "$1" is the project name, ie: "sampleProject";
# Package manager "$2", ie: npm, pnpm, yarn, bun.
# Second paramater "$3" is the scripting language file type, ie: "js", "ts".
# Third paramater "$4" is the styles" file type, ie: "css", "scss", "sass", "less".

function setup() {
  # Creates project:
  mkdir $1 && cd $1;
  if [[$2 $3 $4]] then
    # Initializes the package manager:
    # Script Type:
    {
      touch index.html && mkdir src && touch src/app.$3 ||
      touch src/app.js && touch src/message.$3 ||
      touch src/message.js
    };
    # Styles:
    {
      mkdir styles && touch styles/main.$4 ||
      touch styles/main.css && touch styles/variables.$4 ||
      touch styles/variables.css && touch styles/custom.$4 || touch styles/custom.css
    };
  fi

    if [[$2 == "npm"]] then
      { npm init -y } &&
      { npm install eslint dotenv lite-server nodemon --save-dev };

      if ($3 == "ts") {
        { npm install typescript --save-dev && tsc init }
      }
    fi
    if [[$2 == "bun" || $2 == "pnpm"]] then
      { $2 init } &&
      { $2 add eslint dotenv lite-server nodemon --save-dev };

      if ($3 == "ts") {
        { $2 add typescript --save-dev && tsc init }
      }
    fi
    if [[$2 == "yarn"]] then
      { yarn init -y} &&
      { yarn add eslint dotenv lite-server nodemon --save-dev };

      if ($3 == "ts") {
        { yarn add typescript --save-dev && tsc init }
      }
    fi
    if ($4 == "scss") {
      { $2 install scss --save-dev || $2 add scss --save-dev }
    }
    if ($4 == "sass") {
      { $2 install sass --save-dev || $2 add sass --save-dev }
    }
    if ($4 == "less") {
      { $2 less scss --save-dev || $2 add less --save-dev }
    }
    if ($4 == "css") {
      { $2 install css-linter --save-dev || $2 add css-linter --save-dev }
    }

    # Creates a README.md file, Initializes Git, commits and checks-out into a new starter branch.
    { touch README.md && echo "# $3" >> README.md };
    { git init && gitignore .fleet .idea .vscode .vscodium } && { git checkout -b 001-setup && git add . && git commit -m "Init commit" };

  }
  if ($2 || $3 || $4 == "undefined") {
    echo "⚠️  Error: You are missing a paramater. ⚠️ "
    echo "
    1st). First paramater :'$1' is the project name, ie: 'sampleProject'
    2nd). Package manager '$2', ie: npm, pnpm, yarn, bun.
    3rd). Second paramater '$3' is the scripting language file type, ie: 'js', 'ts'.
    4th). Third paramater '$4' is the styles file type, ie: 'css', 'scss', 'sass', 'less'.
    "
  }
}