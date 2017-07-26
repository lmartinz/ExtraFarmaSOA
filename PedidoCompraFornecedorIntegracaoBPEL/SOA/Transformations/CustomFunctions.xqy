xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace ns1="http://extrafarma.br/xq";


declare function ns1:pad2($number as xs:integer) as xs:string {
    if ($number<10) then concat("0",$number) else string($number) };

declare function ns1:format-dateTime($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
return
  concat($year,ns1:pad2($month),ns1:pad2($day),ns1:pad2($hour),ns1:pad2($min),'00')
};

declare function ns1:format-dateTimePHL($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := fn:seconds-from-dateTime($dateTime)
return
  concat($day,ns1:pad2($month),ns1:pad2($year),ns1:pad2($hour),ns1:pad2($min),ns1:pad2($sec))
};

declare function ns1:format-dateTimeFidelize($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:integer(fn:seconds-from-dateTime($dateTime))
return
  concat($year,'-',ns1:pad2($month),'-',ns1:pad2($day), ' ' , ns1:pad2($hour),':',ns1:pad2($min),':',ns1:pad2($sec))
};


declare function ns1:format-dateFidelize($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
return
  concat($year,'-',ns1:pad2($month),'-',ns1:pad2($day))
};

declare function ns1:format-dateProdoctor($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
return
  concat($year,'-',ns1:pad2($month),'-',ns1:pad2($day))
};


declare function ns1:format-timeFidelize($dateTime as xs:dateTime) as xs:string {
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:integer(fn:seconds-from-dateTime($dateTime))
return
  concat(ns1:pad2($hour),':',ns1:pad2($min) ,':',ns1:pad2($sec) )
};

declare function ns1:format-timeProdoctor($dateTime as xs:dateTime) as xs:string {
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:integer(fn:seconds-from-dateTime($dateTime))
return
  concat(ns1:pad2($hour),':',ns1:pad2($min) ,':',ns1:pad2($sec) )
};

declare function ns1:format-timeEntire($dateTime as xs:dateTime) as xs:string {
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:integer(fn:seconds-from-dateTime($dateTime))
return
  concat(ns1:pad2($hour),ns1:pad2($min) ,ns1:pad2($sec),'00' )
};

declare function ns1:format-timeNotaEntire($dateTime as xs:dateTime) as xs:string {
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:integer(fn:seconds-from-dateTime($dateTime))
return
  concat(ns1:pad2($hour),ns1:pad2($min) ,ns1:pad2($sec))
};


declare function ns1:format-dateTimeEntire($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:integer(fn:seconds-from-dateTime($dateTime))
return
  concat($day,ns1:pad2($month),ns1:pad2($year),ns1:pad2($hour),ns1:pad2($min),ns1:pad2($sec))
};

declare function ns1:format-date($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)    
return
  concat(ns1:pad2($day),ns1:pad2($month),$year)
};

declare function ns1:format-dateLogix($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)    
return
  concat($year,ns1:pad2($month),ns1:pad2($day))
};

declare function ns1:format-dateEpharma($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)    
return
  concat(ns1:pad2($day), ns1:pad2($month) , substring(xs:string($year),3,2))
};

declare function ns1:format-time($dateTime as xs:dateTime) as xs:string {
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)    
return
  concat(ns1:pad2($hour),ns1:pad2($min),'00')
};

declare function ns1:repete-string($stringToRepeat as xs:string?,$count as xs:integer) as xs:string {
   string-join((for $i in 1 to $count return $stringToRepeat),'')
};

declare function ns1:padValuesLeft ( $integerToPad as xs:anyAtomicType?,$length as xs:integer, $char as xs:string) as xs:string {
   concat( ns1:repete-string($char,$length - string-length(string($integerToPad))), string($integerToPad) )
};

declare function ns1:se-null($arg as item()?, $value as item()* )  as item()* {
  if (string($arg) != '')
  then data($arg)
  else $value
};

declare function ns1:cf() {
    "temp_stub"
};

declare function ns1:formatNumber($value as xs:decimal) as xs:string
{
  let $input := tokenize(string(abs($value)),'\.')[1]
  let $dec := substring(tokenize(string($value),'\.')[2],1,2)
  
  return concat(ns1:se-null($input,'0'),substring(concat($dec,'00'),1,2))
};


