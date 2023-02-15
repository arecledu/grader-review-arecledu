# CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'
CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]] then
    echo 'Found ListExamples'
else
    echo 'ListExamples not found'
    exit
fi

cp ../TestListExamples.java ./

javac -cp $CPATH *.java

if [[ $? -eq 0 ]] then
    echo 'Compilation success'
else 
    echo 'Compilation failure'
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 1>&0

if [[ $? -eq 0 ]] then
    echo 'All tests pass!'
else
    echo "Some tests don't pass!"
fi

