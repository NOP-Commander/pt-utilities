#!/bin/sh

##
## this script shows buys from the log of profit trailer in
## the console. i take no responsibility for using this script.
## it works for me though. tested on linux, untested on macos.
##
## this script is open source. do whatever you like to do with it.
##
## ATTENTION: this script might or will fail to work if your
##            path/s to the logfile contains spaces.
##

## EDIT THIS TO YOUR NEEDS
## set not needed PATH_TO_BLA to blank.
## if you comment them out you will encounter
## the limits of exception handling.

PATH_TO_BINA_LOGS=/path/to/pt-binance/logs
PATH_TO_TREX_LOGS=/path/to/pt-bittrex/logs
PATH_TO_POLO_LOGS=/path/to/pt-poloniex/logs

## END OF EDIT THIS

## function to extract the data from the logfile
log_dump () {
	case $2 in
		d)
		SEARCH="dcastrat.*buylo"
		;;

		n)
		SEARCH="normalstrat.*buylo"
		;;

		*)
		SEARCH="strat.*buylo"
		;;
	esac

	# check if the configured path does exist
	if [ -d $1 ] ; then
		grep -i $SEARCH $1/ProfitTrailer.log | sed "s/^\(.*BUYLOG:\).*market\":\"\([^\"]*\).*$/\1 \2/"
	else
		echo "error: path $1 not found"
	fi
}

## if parameters are wrong or missing show usage
usage() {
        echo "Usage: $0 bina/trex/polo [d/n]"
        echo -e "\nfirst parameter must be set to one of these"
        echo "bina - Binance"
        echo "trex - Bittrex"
        echo "polo - Poloniex"
        echo -e "\nsecond parameter is optional"
        echo "d - show dca buys only"
        echo "n - show normal buys only"
}

## check if second parameter is correct when provided
[ "$2" != "d" ]  && [ "$2" != "n" ]  && [ "$2" != "" ] && usage && exit 1

case $1 in
	bina)
	log_dump $PATH_TO_BINA_LOGS $2
	;;

	trex)
	log_dump $PATH_TO_TREX_LOGS $2
	;;

	polo)
	log_dump $PATH_TO_POLO_LOGS $2
	;;

	*)
	usage
	;;
esac

exit 0