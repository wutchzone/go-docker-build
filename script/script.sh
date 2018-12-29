compile_go()
{
    go build -o /go/out/main /go/src/*.go
    echo "Succesfully built"
}

# Check package manager
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
