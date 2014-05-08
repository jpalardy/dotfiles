
java_home() {
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
  java -version
}

