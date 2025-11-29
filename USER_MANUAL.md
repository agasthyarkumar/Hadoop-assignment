🚀 1. Clone the Repository

Open your terminal or Codespace and run:

git clone https://github.com/agasthyarkumar/Hadoop-assignment.git
cd Hadoop-assignment


Check the files:

ls


You should see:

WordCountMapper.java  
WordCountReducer.java  
WordCountDriver.java  
logs.txt  
...

⚙️ 2. Install Java (if not already installed)

This project works with Java 11 or Java 17.

Check Java:

java -version
javac -version


If missing, install:

sudo apt-get update
sudo apt-get install -y openjdk-11-jdk

🏗️ 3. Install Hadoop (local mode)

Download Hadoop:

cd ~
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
tar -xzf hadoop-3.3.6.tar.gz
mv hadoop-3.3.6 hadoop


Set environment variables:

export HADOOP_HOME=$HOME/hadoop
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin


Verify Hadoop:

hadoop version

📝 4. Understanding the Files
File	Description
WordCountMapper.java	Mapper that splits lines into words and emits <word, 1>
WordCountReducer.java	Reducer that sums all counts for each word
WordCountDriver.java	Driver class that configures and runs the MapReduce job
logs.txt	Sample input text file
WordCount.jar	Compiled MapReduce program
🧪 5. Compile the MapReduce Code

Inside the project folder:

cd /workspaces/Hadoop-assignment


Build Hadoop classpath:

HADOOP_CP="$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*"


Compile:

javac -cp "$HADOOP_CP:." WordCountMapper.java WordCountReducer.java WordCountDriver.java


Check .class files:

ls

📦 6. Create the JAR File
jar cf WordCount.jar WordCountMapper.class WordCountReducer.class WordCountDriver.class


List contents:

jar tf WordCount.jar

▶️ 7. Run the WordCount Job

Clean previous output:

rm -rf output


Run Hadoop job:

hadoop jar WordCount.jar WordCountDriver logs.txt output

📄 8. View the Results
cat output/part-r-00000


You will see something like:

hadoop    3
is        2
the       1
...


This is the final WordCount output.

🧹 9. Rerunning the Program

If you update the input file (logs.txt):

Recompile & rebuild JAR (only if code changed)
javac -cp "$HADOOP_CP:." WordCountMapper.java WordCountReducer.java WordCountDriver.java
jar cf WordCount.jar WordCountMapper.class WordCountReducer.class WordCountDriver.class

Rerun Hadoop job
rm -rf output
hadoop jar WordCount.jar WordCountDriver logs.txt output
cat output/part-r-00000

🙋 Troubleshooting
❗ Error: ClassNotFoundException

Rebuild JAR:

rm -rf *.class WordCount.jar
javac -cp "$HADOOP_CP:." *.java
jar cf WordCount.jar *.class

🤝 Contributing

Feel free to submit issues or pull requests.

📜 License

This project is licensed under the MIT License.