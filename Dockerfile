FROM ubuntu:18.04

# Copy files into the container
COPY . /home/video_cap

# Debugging tools
RUN apt-get update -qq && \
  apt-get -y install \
  gdb \
  python3-dbg

# Install Python packages
#COPY requirements.txt /
#RUN pip3 install --upgrade pip
#RUN pip3 install -r /requirements.txt

WORKDIR /home

# Install VideoCap and it's dependencies
RUN chmod +x /home/video_cap/install.sh && \
    /home/video_cap/install.sh && \
    python3 /home/video_cap/setup.py install

CMD ["sh", "-c", "tail -f /dev/null"]
