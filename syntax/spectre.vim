" Vim syntax file
" Language:     Spectre circuit simulator input netlist
" Maintainer:   Yannick Uhlmann, Forked from Ahmed Nabil 
" Last Change:  23-07-2021
" Comments:     Spectre is an advanced circuit simulator from Cadence Design
"               Systems that simulates analog and digital circuits at the
"               differential equation level.
"
" This is based on spectre.vim by Ahmed Nabil which is based on spice.vim by
" Noam Halevy

"" spectre syntax is case INsensitive (but instance names are!)
syn case ignore

"" Notes and Highlights
syn keyword spectreTodo contained TODO FIXME
syn keyword spectreNote contained NOTE IMPORTANT

"" Statements
syn keyword spectreStatement ac alter check dc envlp info montecarlo 
                           \ noise options pac pdisto pnoise psp pss pxf qpac
                           \ qpnoise qpss qpxf set shell sp sweep tdr tran xf
                           \ include section simulatorOptions modelParameter
                           \ element outputParameter saveOptions simultor abs
                           \ acos acosh altergroup asin asinh atan atan2 atanh
                           \ ceil correlate cos cosh else end ends exp export
                           \ floor fmod for function global hypot ic if inline
                           \ int library local log log10 march max min model
                           \ nodeset parameters paramset plot pow print pwr
                           \ real return save sens simulator sin sinh sqrt
                           \ statistics subckt tan tanh to truncate vary

"" Keywords
syn keyword spectreKeyword model a2d b3soipd bjt bjt301 bjt500 bjt503 bsim1
                         \ bsim2 bsim3 bsim3v3 btasoi capacitor cccs ccvs
                         \ cktrom core cpp d2a delay dio500 diode ekv fourier 
                         \ gaas hbt hvmos inductor intcap iprobe isource jfet
                         \ juncap misnan mos0 mos1 mos15 mos2 mos3 mos30
                         \ mos3002 mos705 mos902 mos903 msline mutual_inductor
                         \ nmos nodcap node nport paramtest pcccs pccvs phy_res
                         \ pmos port pvccs pvcvs quantity rdiff relay resistor
                         \ rp2 scccs sccvs svccs svcvs switch tline tom2
                         \ transformer vbic vccs vcvs vsource winding zcccs
                         \ zccvs zvccs zvcvs

"" Numbers, all with engineering suffixes and optional units
" floating point number, with dot, optional exponent
syn match spectreNumber "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
" floating point number, starting with a dot, optional exponent
syn match spectreNumber "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
" integer number with optional exponent
syn match spectreNumber "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="

"" Line Wrapping
syn match spectreWrapLineOperator "\\$"
syn match spectreWrapLineOperator "^+"

"" Strings and assignements
syn match  spectreStatement   "^ \=\.\I\+"
syn region spectreString      start=+L\="+ skip=+\\\\\|\\"+ end=+"+
syn region spectreSinglequote matchgroup=spectreOperator start=+'+ end=+'+ oneline

"" Ignore
syn match spectreIgnore "\ \ \ "

"" Matching pairs of parentheses
syn region spectreParen transparent matchgroup=spectreOperator
                      \ start="(" end=")" contains=ALLBUT,spectreParenError

"" Mathematical Operators
syn match spectreOperator "\v[\!\%\&\*\|\+\-\\\/\<\>\^\=\?]"

"" Comments
syn match  spectreComment "\v//.*$" contains=spectreTodo,spectreNote
syn region spectreComment start="\v\/\*" end="\v\\*\/" contains=spectreTodo,spectreNode

"" Errors
syn match spectreParenError     ")"
syn match spectreCommentError   "*/"

"" Syncs
syn sync minlines=50

hi default link spectreTodo             Todo
hi default link spectreWrapLineOperator spectreOperator
hi default link spectreSinglequote      spectreExpr
hi default link spectreExpr             Type
hi default link spectreParenError       Error
hi default link spectreCommentError     Error
hi default link spectreStatement        Statement
hi default link spectreNumber           Number
hi default link spectreComment          Comment
hi default link spectreOperator         Operator
hi default link spectreString           String
hi default link spectreKeyword          Function 
hi default link spectreIgnore           Ignore

let b:current_syntax = "spectre"
