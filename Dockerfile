FROM public.ecr.aws/lambda/python:3.8

RUN yum update -y && yum install -y nc iputils
# Copy function code
# LAMBDA_TASK_ROOT=/var/task
COPY app.py ${LAMBDA_TASK_ROOT}

# Install the function's dependencies using file requirements.txt
# from your project folder.
COPY lambda-entrypoint.sh /lambda-entrypoint.sh
RUN chmod +x /lambda-entrypoint.sh

COPY requirements.txt  .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN  pip3 install -r requirements.txt

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]