" Vim syntax file
" Language:     Spectre circuit simulator input netlist
" Maintainer:   Yannick Uhlmann, Forked from Ahmed Nabil 
" Last Change:  23-07-2021
" Comments:     Spectre is an advanced circuit simulator from Cadence Design Systems
"               that simulates analog and digital circuits at the differential equation level.
"
" This is based on spectre.vim by Ahmed Nabil which is based on spice.vim by Noam Halevy

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" spectre syntax is case INsensitive (but instance names are!)
syn case ignore

syn keyword spectreTodo        contained TODO FIXME
syn keyword spectreNote        contained NOTE IMPORTANT

syn keyword spectreStatement   ac alter check dc envlp info montecarlo \
                                   noise options pac pdisto pnoise psp pss pxf 
                                   qpac qpnoise qpss qpxf set shell sp sweep \
                                   tdr tran xf include section \
                                   simulatorOptions modelParameter element \
                                   outputParameter saveOptions simultor abs \
                                   acos acosh altergroup asin asinh atan \
                                   atan2 atanh ceil correlate cos cosh else \
                                   end ends exp export floor fmod for \
                                   function global hypot ic if inline int \
                                   library local log log10 march max min \
                                   model nodeset parameters paramset plot pow \
                                   print pwr real return save sens simulator \
                                   sin sinh sqrt statistics subckt tan tanh \
                                   to truncate vary


syn keyword spectreKeyword     model a2d b3soipd bjt bjt301 bjt500 bjt503
                                   bsim1 bsim2 bsim3 bsim3v3 btasoi capacitor \
                                   cccs ccvs cktrom core d2a delay dio500 \
                                   diode ekv fourier gaas hbt hvmos inductor \
                                   intcap iprobe isource jfet juncap misnan \
                                   mos0 mos1 mos15 mos2 mos3 mos30 mos3002 \
                                   mos705 mos902 mos903 msline \
                                   mutual_inductor nodcap node nport \
                                   paramtest pcccs pccvs phy_res port pvccs \
                                   pvcvs quantity rdiff relay resistor scccs \
                                   sccvs svccs svcvs switch tline tom2 \
                                   transformer vbic vccs vcvs vsource winding \
                                   zcccs zccvs zvccs zvcvs \

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
syn match   spectreStatement "^ \=\.\I\+"
syn region  spectreString    start=+L\="+ skip=+\\\\\|\\"+ end=+"+

"" Comments
syn region spectreComment start="//.*" contains=spectreTodo,spectreNote
syn region spectreComment start="/*" end="*/" contains=spectreTodo,spectreNode

"" Ignore
syn match spectreIgnore "\ \ \ "

"" Matching pairs of parentheses
syn region spectreParen transparent matchgroup=spectreOperator \
    start="(" end=")" contains=ALLBUT,spectreParenError

syn region spectreSinglequote matchgroup=spectreOperator start=+'+ end=+'+ oneline
"syn match spectreKeyword /)\ \<[a-z]\+[0-9]*[a-z]*\>\ /

"" Errors
syn match spectreParenError ")"
syn match spectreCommentError "*/"

" Syncs
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_spectre_syntax_inits")
  if version < 508
    let did_spectre_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink spectreTodo             Todo
  HiLink spectreWrapLineOperator spectreOperator
  HiLink spectreSinglequote      spectreExpr
  HiLink spectreExpr             Function
  HiLink spectreParenError       Error
  HiLink spectreCommentError       Error
  HiLink spectreStatement        Statement
  HiLink spectreNumber           Number
  HiLink spectreComment          Comment
  HiLink spectreOperator         Operator
  HiLink spectreString           String
  HiLink spectreKeyword          Type 
  HiLink spectreIgnore           Ignore

  delcommand HiLink
endif

let b:current_syntax = "spectre"
