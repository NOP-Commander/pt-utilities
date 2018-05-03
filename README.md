# pt-utilities

Hi there,

here you will find some small helpers i made/use for Profit Trailer. 

<b>just for the record: i don't take any responsibility for using them. they are working for me at least. everything published here is open source. do whatever you want to do with it.</b>

## simple-dca-calc
as the name says it, this is a spreadsheet which can be used as a simple DCA Calculator (file format is LibreOffice or Excel XML)

## print-pt-buylog.sh
simple shell-script i made which shows all buys from the current logfile of Profit Trailer. i use it from time to time to quickly check the buys my bot did lately.

sample output:

```
$ print-pt-buylog.sh bina | tail -10
2018-05-03 08:00:52 INFO NormalStrategyRunner - BUYLOG: LSKBTC
2018-05-03 08:03:48 INFO DCAStrategyRunner - BUYLOG: EOSBTC
2018-05-03 08:08:47 INFO DCAStrategyRunner - BUYLOG: TRXBTC
2018-05-03 08:48:46 INFO NormalStrategyRunner - BUYLOG: NCASHBTC
2018-05-03 09:49:45 INFO DCAStrategyRunner - BUYLOG: TRXBTC
2018-05-03 10:09:58 INFO NormalStrategyRunner - BUYLOG: POABTC
2018-05-03 10:18:58 INFO NormalStrategyRunner - BUYLOG: LINKBTC
2018-05-03 10:19:22 INFO NormalStrategyRunner - BUYLOG: STORMBTC
2018-05-03 10:44:03 INFO DCAStrategyRunner - BUYLOG: ADABTC
2018-05-03 12:00:51 INFO NormalStrategyRunner - BUYLOG: ELFBTC
```

usage:

```
$ print-pt-buylog.sh 
Usage: ./print-pt-buylog.sh bina/trex/polo [d/n]

first parameter must be set to one of these
bina - Binance
trex - Bittrex
polo - Poloniex

second parameter is optional
d - show dca buys only
n - show normal buys only
