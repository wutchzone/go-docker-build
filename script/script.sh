compile_go()
{
    if go build -o /go/bin/main /go/src/*.go 2>/dev/null; then
        echo "Succesfully built"
    elif go build -o /go/bin/main /go/src/me/project/cmd/*/*.go 2>/dev/null; then
        echo "Succesfully built"
    else
        echo "Error while building"
    fi
}

if [ -d /go/src/me/project ]; then
    cd /go/src/me/project
else 
    cd /go/src
fi

# Check package manager
if ! [ -z "$PACKAGE_MANAGER" ]; then
    if [ "$PACKAGE_MANAGER" = "dep" ]; then
        echo "Installing DEP dependencies..."
        dep ensure
        compile_go
        exit 0
    elif [ "$PACKAGE_MANAGER" = "none" ]; then
        compile_go
        exit 0
    fi
fi

echo "Specify package manager to the \$PACKAGE_MANAGER variable"
echo "available:"
echo "  dep"
echo "  none"
exit 1
