#!/bin/bash

# Exit immediately if any command fails
set -e

echo "Starting test script..."

# This will cause an error - trying to access a non-existent file
echo "Trying to read a non-existent file..."

# This line will never be reached due to the error above
echo "Creating output file..."
echo "Script completed successfully" > output.txt

echo "Script finished."
