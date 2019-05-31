FROM jupyter/scipy-notebook:latest

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends python-numpy libicu-dev

WORKDIR /home/jovyan/work

USER $NB_UID

# Install Python 3 packages
# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
# use notebook-friendly backends in these images
RUN conda install --quiet --yes \
  'spacy' \
  'gensim' \
  'pyldavis' \
  'jupyterthemes' \
  'langdetect' \
  'tabpy-server' \
  'nltk' \
  'wordcloud'

RUN python -m spacy download de_core_news_md
RUN python -m spacy download fr_core_news_md
RUN python -m spacy download en_core_web_md
RUN python -m spacy download xx_ent_wiki_sm

USER root
COPY jupyter_notebook_conf/jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py


