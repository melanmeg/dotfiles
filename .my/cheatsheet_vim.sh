######################## ################################# ###############################
		SPLIT                  		basic                            vim command
######################## ################################# ###############################
ss    : side split       <C-u> : half screen up            [insert mode] jj -> [command mode]
sv    : length split     <C-d> : half screen down          <C-n>,<C-p> : complement
- Move sh sj sk sl       <C-b> : screen up
- Moveone sH sJ sK sL    <C-f> : screen down               v : (visual mode               )
                         u     : Undo                      V : (visual line mode          )
<C-w> : length max_      <C-u> : Redo                      <C-v> : (visual block mode     )
<C^w> : side max         w  : proceed to head of word      <C-v> : rectagle visual mode
so    : size fit         2w : head of two word             ---> <S-i> : insert mode in r v mode (left)
s>    : width add        b  : return to head of word       ---> <S-a> : insert mode in r v mode (right)
s<    : width reduce     e  : proceed to end of word       ---> $,(0,^) : insert mode in r v mode
s+    : height add       ge : return to end of word            (to end of line,(head,head of not space))
s-    : heigth reduce    ***W,B,E,gE                       ---> > : right shift in r v mode
***size change           / : forward                       ---> > : right shift in r v mode
                         ? : backward                      ---> r : replace in r v mode
- 'st' : new tab         n : forward repeat                ---> <C-c> : insert text into columns
- 'sn' : next tab        N : backward repeat               ---> <C-c> : insert text into columns
- 'sp' : before tab      % : to ()                         *** yank,cut As it is *** last<ESC>
- 'sq' : close tab       d$ : delete end line from cursor
- 'sQ' : close buffer    dw : delete word
- 'sT' : tab             d2w : two
- 'sB' : buffer chart    yiw : yank word on cursor
- 'tt' : tabnew          :reg : show register chart
- 'tn' : left tab        "ayy :  " Register start,
- 'tp' : right tab       a Use name as 'a',
                         y Register yank
                         "ap : 'a' paste
                         :{num} : mode to {num} line
