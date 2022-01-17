FROM ubuntu
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y curl sudo git
WORKDIR .
COPY ./bootstrap.sh /
RUN bash < bootstrap.sh
# RUN curl https://raw.githubusercontent.com/mgouzenko/configs/master/bootstrap.sh  | bash
