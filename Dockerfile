# Use Debian Bookworm for arm64 as base image
FROM --platform=linux/arm64 debian:bookworm-slim

# Set working directory
WORKDIR /usr/local/bin

# Copy your prebuilt binary into the image
COPY hello /usr/local/bin/hello

# Make sure the binary is executable
RUN chmod +x /usr/local/bin/hello

# Expose the port the binary listens on
EXPOSE 8080/tcp

# Run the binary
CMD ["/usr/local/bin/hello"]
