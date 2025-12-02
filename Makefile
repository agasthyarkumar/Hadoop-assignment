# Makefile for Hadoop WordCount project
# Targets: all (default), compile, jar, run, clean, help

JAVAC=javac
JAR=jar
HADOOP=hadoop

SRC=$(wildcard *.java)
CLASS_DIR=build
JAR_NAME=wordcount.jar
MAIN_CLASS=WordCountDriver
HADOOP_CLASSPATH?=$(shell $(HADOOP) classpath 2>/dev/null || echo "")

.PHONY: all compile jar run clean help

all: jar

compile:
	mkdir -p $(CLASS_DIR)
	$(JAVAC) -cp "$(HADOOP_CLASSPATH)" -d $(CLASS_DIR) $(SRC)

jar: compile
	cd $(CLASS_DIR) && $(JAR) cf ../$(JAR_NAME) *
	@echo "Created $(JAR_NAME)"

run:
	@if command -v $(HADOOP) >/dev/null 2>&1; then \
		$(HADOOP) jar $(JAR_NAME) $(MAIN_CLASS) $(IN) $(OUT); \
	else \
		echo "Hadoop not found; running with 'java' (ensure Hadoop jars in CLASSPATH)"; \
		java -cp $(JAR_NAME):$(HADOOP_CLASSPATH) $(MAIN_CLASS) $(IN) $(OUT); \
	fi

help:
	@echo "Usage: make [target] [IN=input_path] [OUT=output_path]"
	@echo "Targets: all, compile, jar, run, clean, help"
	@echo "Example: make run IN=/input/path OUT=/output/path"

clean:
	rm -rf $(CLASS_DIR) $(JAR_NAME)
