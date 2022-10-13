# Dockerfile
FROM python:3.6-slim-stretch

WORKDIR /usr/app

EXPOSE 8080

COPY /src/requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
RUN pip install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html && rm -rf /var/lib/apt/lists/*
ADD ./src ./

CMD ["python", "-u", "app.py"]

# gtp2-317507/ nombre del servicio en google cloud 

# docker tag text-generator-gpt2:latest eu.gcr.io/gtp2-317507/text-generator-gpt2:latest
# docker push eu.gcr.io/gtp2-317507/text-generator-gpt2:latest

# docker tag text-generator-gpt2:latest gcr.io/gtp2-317507/text-generator-gpt2:latest
# docker push gcr.io/gtp2-317507/text-generator-gpt2:latest

#gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://eu.gcr.io

#gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://gcr.io

#$env:GOOGLE_APPLICATION_CREDENTIALS="D:\vide\file2\GTP-2\GTP_app\Text-Generation-gpt2-master_0\Writer-c99b0315f864.json"