# note that the sharedsecret is stored in clear (think wep shared secrets)
# so don't go using your favorite most secure password here...
botrunnername="dockerbot"
sharedsecret="dockerbotpw15"
#max memory each botrunner instance can use, in MBs
maxmemory = 2048
#max amount of spring instances, valid values are 1,2,3,4... or 'auto' which 
#will assign it as the amount of cores; AUTO NOT IMPLEMENTED YET
maxinstances = 'auto'
debug = False

# example websiteurls:
# websiteurl =  "http://localhost/ailadder"
# websiteurl =  "http://manageddreams.com/ailadder"
# websiteurl =  "http://manageddreams.com/ailadderstaging"
# websiteurls  = [ "http://localhost:8000/botrunner_webservice" ]
websiteurls  = [ "http://ec2-52-24-31-116.us-west-2.compute.amazonaws.com:8000/botrunner_webservice" ]

sleepthislongwhennothingtodoseconds = 60

allowdownloading = True
cancompile = False

# override this if you want, eg we do on aegis' cluster
# should point to the 'AI' directory itself where you want to install the AIs
aiinstallationdirectory = "/botrunner_folder/spring/AI"

# full path to spring source directory, ie to a directory that conains 'rts', 'AI', 'build'
# the subdirectory 'build' should be already created, and ccmake run from that directoryy
# ideally spring itself and so on hvae already been built once too ;-)
springSourcePath="/botrunner_folder/spring"

# full path to "spring(.exe)" or "spring-headlessstubs(.exe)"
springPath="/botrunner_folder/spring/spring-headless"

# full path to unitsync.dll or (lib)unitsync.so
unitsyncPath="/botrunner_folder/spring/libunitsync.so"

# value of JAVA_HOME, eg /usr/lib/jvm/java-6-sun/jre
JAVA_HOME = "/usr/bin/java"

#######################################################################3
# stuff under this line probably doesn't need modifying, in general

scripttemplatefilename = "scripttemplate.txt"
pingintervalminutes = 5

