
compile_go()
{
    go build *.go -o main
    echo "Succesfully built"
}

# Navigate to source dir and Check for package manager
cd /go/src

if ! [ -z "$PACKAGE_MANAGER" ]; then
    if [ "$PACKAGE_MANAGER" = "dep" ]; then
        echo "Installing DEP dependencies..."
        dep ensure
        compile_go
        exit 0
    fi
    if [ "$PACKAGE_MANAGER" = "none" ]; then
        compile_go
        exit 0
    fi
fi

echo "Specify package manager to the \$PACKAGE_MANAGER variable"
echo "available:"
echo "  dep"
echo "  none"
exit 1


