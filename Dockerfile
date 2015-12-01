FROM ubuntu

MAINTAINER Gajo Petrovic, gajop01@gmail.com

#RUN echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list

RUN apt-get update -y -q
RUN apt-get install -y -q p7zip-full
RUN apt-get install -y -q wget
RUN apt-get install -y -q default-jdk
RUN apt-get install -y -q unzip

RUN mkdir botrunner_folder
RUN cd botrunner_folder

RUN wget -O spring.7z 			https://springrts.com/dl/buildbot/default/master/100.0/linux64/spring_100.0_minimal-portable-linux64-static.7z 
RUN wget -O spring_src.tar.gz 	https://springrts.com/dl/buildbot/default/master/100.0/source/spring_100.0_src.tar.gz
RUN wget https://github.com/gajop/botrunner/archive/master.zip -o botrunner
RUN 7z x spring.7z o spring
RUN tar xvf spring_src.tar.gz

# Add maps/games
RUN pushd spring

RUN mkdir maps
RUN pushd maps
RUN wget http://spring1.admin-box.com/downloads/spring/spring-maps/TitanDuel.sd7
RUN wget http://spring1.admin-box.com/downloads/spring/spring-maps/Eye_Of_Horus_v2.sd7
RUN wget http://api.springfiles.com/files/maps/intersection_v3.sd7
RUN wget http://spring1.admin-box.com/downloads/spring/spring-maps/RedComet.sd7
RUN wget http://spring1.admin-box.com/downloads/spring/spring-maps/Barren.sd7
RUN wget http://spring1.admin-box.com/downloads/spring/spring-maps/Bandit_plains_v1.sd7
RUN wget http://api.springfiles.com/files/maps/wanderlust_v01.sd7
RUN wget http://spring1.admin-box.com/maps/victoria_crater_v2.1.sd7
RUN popd

RUN mkdir games
RUN pushd games
RUN wget https://github.com/Anarchid/Zero-K/archive/aitourney.zip -o ZK-aitourney.sdd
RUN popd

RUN mkdir -p AI/Skirmish
RUN pushd AI/Skirmish
RUN wget https://www.dropbox.com/s/lsknymk0yyssx3m/ZKGBAI_0.4.7z?dl=1
RUN 7z x ZKGBAI_0.4.7z
RUN wget https://www.dropbox.com/s/0ae5wbevyubfmqp/CircuitAI_0_7_6_4.zip?dl=1
RUN unzip CircuitAI_0_7_6_4.zip
RUN wget https://dl.dropboxusercontent.com/u/19320633/zkai.7z
RUN 7z x zkai
RUN popd

# Configure botrunner
RUN unzip botrunner
RUN pushd botrunner
ADD config.py /botrunner_folder/botrunner/botrunner
RUN popd botrunner

RUN popd
