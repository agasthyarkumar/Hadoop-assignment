# Hadoop-assignment

Simple Hadoop MapReduce WordCount assignment in Java

## Overview
This repository contains a basic WordCount MapReduce implementation using Java and Hadoop.

## Contents
- `WordCountDriver.java`, `WordCountMapper.java`, `WordCountReducer.java` — Java source files.
- `WordCount.jar` — built JAR (if present).
- `*.class` — compiled classes (should be removed from source control).
- `output/` — sample output (ignored by `.gitignore`).

## Build
1. Ensure Java and Hadoop are installed and `hadoop` is on your PATH.
2. Compile the sources (example):

	javac -cp "$(hadoop classpath)" -d build *.java

3. Package into a jar:

	jar -cvf WordCount.jar -C build/ .

## Run (example)
Run the job on Hadoop (replace `<input>` and `<output>` with HDFS paths or local paths as appropriate):

	hadoop jar WordCount.jar WordCountDriver <input> <output>

## Project notes
- The repo includes a sample `output/part-r-00000` with example results.
- Remove compiled classes and jars from source control or add them to `.gitignore`.
- Adjust the classpath and driver class name as needed when running.

## License
This project is licensed under the MIT License — see `LICENSE`.

## Contributing
See `CONTRIBUTING.md` for contribution guidelines.
