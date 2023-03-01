CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'
DIVIDER='----------------------------'

if [[ $OSTYPE == msys ]] then
    CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'
fi


rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning!'

cd student-submission

if [[ -f ListExamples.java ]] then
    echo 'Found ListExamples!'
else
    echo 'ListExamples not found!'
    exit
fi

cp ../TestListExamples.java ./

javac -cp $CPATH *.java

if [[ $? -eq 0 ]] then
    echo 'Compilation success!'
else 
    echo 'Compilation failure!'
    exit
fi

echo $DIVIDER
ERR=$(java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 2>&1 | grep "Tests run")

if [[ $? -eq 0 ]] then
    echo "Some tests don't pass!"
else
    echo 'All tests pass!'
fi

echo $ERR