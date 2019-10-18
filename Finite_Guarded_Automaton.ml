(* lista de módulos abertos *)
open Scanf;;
open Printf;;
open List;;

(* definição dos types *)
type letra = char 
type fita = letra list
type estado = int
type trans = (estado * letra * string * string * char * estado)
type maq = (trans list * estado list * estado list)
type memoria = ( (int * char) list * fita)
exception FIM of memoria 

let x = ref 0

(* função recursiva para a leitura dos estados iniciais *)
let leitura_iniciais n =
    let rec leitor_iniciais lista n =
      if n=0 then lista else let state = Scanf.scanf "%d " (fun x -> x) in
                            let lista = lista@[(state,'0')] in
                            leitor_iniciais lista (n-1)
                            in 
                            leitor_iniciais [] n
(* função recursiva para a leitura dos estados finais *)
let leitura_finais n =
    let rec leitor_finais lista n =
      if n=0 then lista else let state = Scanf.scanf "%d " (fun x -> x) in
                            let lista = lista@[state] in
                            leitor_finais lista (n-1)
                            in 
                            leitor_finais [] n

(* função recursiva para a leitura dos inputs *)
let leitura_transicoes n =
let rec leitor_inputs lista n =
if n = 0 then
lista
else
let a = Scanf.scanf "%d " (fun x -> x) in
let b = Scanf.scanf "%c " (fun x -> x) in
let c = Scanf.scanf "%s " (fun x -> x) in
let d = Scanf.scanf "%s " (fun x -> x) in
let e = Scanf.scanf "%c " (fun x -> x) in
let f = Scanf.scanf "%d\n" (fun x -> x) in
let transicao = (a, b, c, d, e, f) in
let lista = lista@[transicao] in
leitor_inputs lista (n-1)
in
leitor_inputs [] n

(* função que verifica se c1 é um subconjunto de c2*)
let subset c1 c2 = 
  for_all  (function x -> (mem x c2)) c1;;

(* verifica se c1 é igual a c2, isto é, se são subconjuntos um do outro *)
let  equals c1 c2 = 
  (subset c1 c2) && (subset c2 c1);;

(*retira as repetições numa lista*)
let normalize c = 
  fold_left 
    (fun res x -> 
      if (mem x res) 
      then res 
      else (x::res) ) 
    [] c

(*união de duas listas do mesmo tipo 'a*)
let union c1 c2 = 
  normalize (c1@c2);;

(* verifica se a operação se enquadra em algum dos seguintes casos, se sim retorna true, se não retorna false *)
let verifica_operacao operacao x a =
  match operacao with
  | "_" -> true
  | "<" -> x < a
  | "<=" -> x <= a
  | "=" -> x = a
  | "!=" -> x <> a
  | ">=" -> x >= a
  | ">" -> x > a
  | _ -> false

(* funçãon disponibilizada pelo professor, alterada de acordo com o problema*)
let epsilon_trans_aux st trans =
  let (n,m) = st in
  map(function (a,b,c,d,e,f) -> (f,(if e= '_' then m else e)))
  (filter(function (x,y,w,z,g,v) -> x=n && y='_' && (if w = "_" && z = "_" then true else verifica_operacao w ((int_of_char m) - 48) (int_of_string z))) trans)


(*generalização da função a cima *)
let rec epsilon_trans lstatei trans =
    let res = (normalize(flatten(map(fun (x,y) -> epsilon_trans_aux (x,y) trans) lstatei))) in
    let resultado = (union res lstatei) in
    if (equals resultado lstatei) then resultado
    else (epsilon_trans resultado trans)

(* função disponibilizada pelo prof, alterada de acordo com o problema *)
let select estado letra trans =
    let (n,m) = estado in
    map(function(a,b,c,d,e,f) -> (f,(if e = '_' then m else e)))
    (filter (function (x,y,w,z,g,v) -> x=n && y=letra && (if w="_" && z="_" then true else verifica_operacao w ((int_of_char m) - 48) (int_of_string z))) trans)

(* função disponibilizada pelo prof, alterada de acordo com o problema*)
let next letra memo trans lst =   
  let tr = (fold_left (fun x y -> (select y letra trans)@x ) [] lst) in
  let res =  epsilon_trans  (normalize tr) trans  in
  res

(* função que "explode" uma string para uma lista de substrings de acordo com o carácter lido*)
let explode s =
  let rec exp i l =
  match i with
   _ when i < 0 -> l
  | _ -> exp (i-1) (s.[i]::l)
        in exp (String.length s - 1) []

(* função que retorna a lista de estados correntes *)
let rec lista_correntes word memoria lst trans =
      match word with
      [] -> lst
      | el::rest ->
          let var = next el memoria trans lst in
          lista_correntes rest memoria var trans

(* função que verifica se algum dos elementos da lista corrente se encontra na lista de estados finais *)
let rec check state finalState =
match state with
| [] -> false
| (s, _)::tl ->
if List.mem s finalState then (* list.mem retorna true se o elemento s se encontrar na lista de estados finais*)
true
else
check tl finalState


(* leitura do input *)
let leitura () = 
  let _n = scanf "%d\n" (fun x -> x) in
  let num_iniciais = scanf "%d\n" (fun x -> x) in 
  let lista_iniciais = leitura_iniciais num_iniciais in
  let num_finais = scanf "%d\n" (fun x -> x) in
  let lista_finais = leitura_finais num_finais in 
  let num_transicoes = scanf  "%d\n" (fun x -> x) in
  let transicoes = ref []
  in transicoes := leitura_transicoes num_transicoes;
  let word = scanf "%s\n" (fun x -> x) in
  let maquina = explode word in
  (List.rev maquina,(!transicoes,lista_iniciais,lista_finais))

let letra,maq = leitura () 
let trans,lst_iniciais,lst_finais = maq 
let memoria = ((epsilon_trans lst_iniciais trans),letra) 
let l_corrente = epsilon_trans lst_iniciais trans 
let obtido = lista_correntes letra memoria l_corrente trans 
let () = if check obtido lst_finais then printf "YES\n" else printf "NO\n";;
