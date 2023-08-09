FROM --platform=linux/amd64 ubuntu:latest

# Update the system and install mdadm and other utilities
RUN apt-get update && \
    apt-get install -y mdadm parted && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
CMD ["tail", "-f", "/dev/null"]