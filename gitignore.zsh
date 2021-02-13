gitignore() {
   if [ -n "$1" ]; then
      for x in $@; do
         response="$(curl -s https://raw.githubusercontent.com/github/gitignore/master/$x.gitignore)"
         if [[ $response  =~ "404" ]]; then
            echo "Could not find a $x.gitignore file. Resolve manually."
         else
            echo "# Default $x.gitignore imported below..." >> .gitignore
            echo $response >> .gitignore
            echo "\n\n" >> .gitignore
         fi
      done
   else
      echo "Provide technology/programming language name as argument"
   fi
}