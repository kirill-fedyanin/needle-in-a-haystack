#FROM python:3.12
#
#ENV PYTHONPATH /app
#ENV PYTHONUNBUFFERED 1
#
#WORKDIR /app
#
#COPY requirements.txt .
#
#RUN pip install --no-cache-dir -r requirements.txt
#
#COPY . .
#
#ENTRYPOINT ["python"]
#CMD ["main.py"]

# Sagmaker compatible docker

FROM 763104351884.dkr.ecr.ap-south-1.amazonaws.com/pytorch-training:2.4.0-gpu-py311-cu124-ubuntu22.04-sagemaker

# First, you might need to set up SSH for git clone
# If this is a private repo, you'll need to handle SSH keys appropriately
RUN git clone git@github.com:kirill-fedyanin/needle-in-a-haystack.git

# Change working directory
WORKDIR /needle-in-a-haystack

# Now ls and pip install will run in the correct directory
RUN ls -la
RUN pip install -r requirements.txt && pip install -e .