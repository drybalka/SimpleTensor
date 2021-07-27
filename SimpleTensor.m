(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
BeginPackage["SimpleTensor`"]
DefineSpace::usage=
"DefineSpace[\!\(\*
StyleBox[\"name\",\nFontSlant->\"Italic\"]\), \!\(\*
StyleBox[\"dim\",\nFontSlant->\"Italic\"]\)] defines a space of dimension \!\(\*
StyleBox[\"dim\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)with a string \!\(\*
StyleBox[\"name\",\nFontSlant->\"Italic\"]\) on which tensor calculations will be performed. The optional variables are:
	\!\(\*
StyleBox[\"index\",\nFontSlant->\"Italic\"]\) - a list of indices on this space or a string prefix to generate names automatically, if missing \!\(\*
StyleBox[\"name\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)is used as a prefix;
	\!\(\*
StyleBox[\"coord\",\nFontSlant->\"Italic\"]\) - a list of coordinates on this space or a string prefix to generate names automatically, if missing \!\(\*
StyleBox[\"name\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)is used as a prefix."

SetTensor::usage=
"SetTensor[\!\(\*
StyleBox[\"t\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"[\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"\[Mu]\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"]\",\nFontSlant->\"Italic\"]\), \!\(\*
StyleBox[\"arr\",\nFontSlant->\"Italic\"]\)] associates array \!\(\*
StyleBox[\"arr\",\nFontSlant->\"Italic\"]\) to a tensor \!\(\*
StyleBox[\"t\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"[\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"\[Mu]\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"]\",\nFontSlant->\"Italic\"]\). For convenience this function overrides the built-in Congruent function. To change the default behavior edit corresponding lines in the package file."

GetArray::usage=
"GetArray[\!\(\*
StyleBox[\"expr\",\nFontSlant->\"Italic\"]\)] substitutes arrays into tensor variables and performs contractions and math operations. The optional variables are:
	\!\(\*
StyleBox[\"indices\",\nFontSlant->\"Italic\"]\) - a list of indices in which order the tensor should be transposed. If omitted indices are taken to be in standard order, i.e., the one returned by the standard Sort[] function."

metric::usage=
"metric[-\!\(\*
StyleBox[\"i1\",\nFontSlant->\"Italic\"]\), -\!\(\*
StyleBox[\"i2\",\nFontSlant->\"Italic\"]\)] is the metric tensor for the space in which \!\(\*
StyleBox[\"i1\",\nFontSlant->\"Italic\"]\) and \!\(\*
StyleBox[\"i2\",\nFontSlant->\"Italic\"]\) are defined. 
metric[\!\(\*
StyleBox[\"i1\",\nFontSlant->\"Italic\"]\), \!\(\*
StyleBox[\"i2\",\nFontSlant->\"Italic\"]\)] is the inverse metric tensor. If \!\(\*
StyleBox[\"i1\",\nFontSlant->\"Italic\"]\) and \!\(\*
StyleBox[\"i2\",\nFontSlant->\"Italic\"]\) belong to different spaces then it works as a tetrad (vielbein) tensor and represents the change of basis."

basis::usage=
"basis[\!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\)] is the tensor of basis forms for the space in which index \!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\) is defined.
basis[-\!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\)] is the tensor of basis vectors."

\[Eth]::usage=
"\[Eth][\!\(\*
StyleBox[\"\[PlusMinus]\", \"OperatorCharacter\"]\)\!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\)] is the tensor derivative for the space in which index \!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\) is defined. 
\[Eth]\!\(\*
StyleBox[\"space\",\nFontSlant->\"Italic\"]\)[\!\(\*
StyleBox[\"\[PlusMinus]\", \"OperatorCharacter\"]\)\!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"]\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)is also defined for a derivative in the space \!\(\*
StyleBox[\"space\",\nFontSlant->\"Italic\"]\), which can be used with any \!\(\*
StyleBox[\"i\",\nFontSlant->\"Italic\"]\)."

TensorPlus::usage=
"TensorPlus[\!\(\*
StyleBox[\"args\",\nFontSlant->\"Italic\"]\)] is used to add matrix-valued tensors (for example, the set of Dirac matrices \[Gamma][\[Mu]]) with explicit lists (for example, IdentityMatrix[4]). It is equivalent to Plus[] in most cases, except it prevents the automatic threading over lists. For convenience this function overrides the built-in CirclePlus function."


DirectProduct::usage=
"DirectProduct[\!\(\*
StyleBox[\"args\",\nFontSlant->\"Italic\"]\)] represents the tensor product of basis vectors and forms. It expands \!\(\*
StyleBox[\"args\",\nFontSlant->\"Italic\"]\) automatically until a sum of basis tensor products is achieved. For convenience this function overrides the built-in CircleTimes function."

WedgeProduct::usage=
"WedgeProduct[\!\(\*
StyleBox[\"args\",\nFontSlant->\"Italic\"]\)] represents the wedge product of basis forms. It expands \!\(\*
StyleBox[\"args\",\nFontSlant->\"Italic\"]\) automatically until a sum of basis wedge products is achieved. For convenience this function overrides the built-in Wedge function."

ExteriorDerivative::usage=
"ExteriorDerivative[\!\(\*
StyleBox[\"space\",\nFontSlant->\"Italic\"]\)][\!\(\*
StyleBox[\"expr\",\nFontSlant->\"Italic\"]\)] gives the exterior derivative of \!\(\*
StyleBox[\"expr\",\nFontSlant->\"Italic\"]\) in \!\(\*
StyleBox[\"space\",\nFontSlant->\"Italic\"]\). If latter is a Sequence of spaces, the exterior derivative is taken in their product space. If \!\(\*
StyleBox[\"space\",\nFontSlant->\"Italic\"]\) is empty, the exterior derivative is taken in the product space of all defined spaces."

InteriorProduct::usage=
"InteriorProduct[\!\(\*
StyleBox[\"expr1\",\nFontSlant->\"Italic\"]\), \!\(\*
StyleBox[\"expr2\",\nFontSlant->\"Italic\"]\)] is the symmetric interior product of basis vectors and forms in \!\(\*
StyleBox[\"expr1\",\nFontSlant->\"Italic\"]\) and \!\(\*
StyleBox[\"expr2\",\nFontSlant->\"Italic\"]\). The DirectProducts of basises are multiplied successively starting from the first position."





Begin["`Private`"]

(*Set to True to print debug information.*)
$Verbose=False;
(*Dictionary for the dimension of spaces.*)
SpaceDim=<||>;
(*Dictionary to save tensor values.*)
TensorValues=<||>;
(*Dictionary to save which index lives in which space*)
IndexSpace=<||>;
(*Dataset to save coordinate space information.*)
CoordSpace=Dataset[{}];


(*Overriding for convenience the operators without built-in meaning. Comment these if you need the overriden operators for other purpuses.*)
Format[HoldPattern@SetTensor[args__]]:=Defer@Congruent[args];
Congruent=SetTensor;
Format[HoldPattern@TensorPlus[args__]]:=Defer@CirclePlus[args];
CirclePlus=TensorPlus;
Format[HoldPattern@DirectProduct[args__]]:=Defer@CircleTimes[args];
CircleTimes=DirectProduct;
Format[HoldPattern@WedgeProduct[args__]]:=Defer@Wedge[args];
Wedge=WedgeProduct;


(*Helper functions for pattern recognition.*)
IndexQ[ind_]:=MemberQ[Keys@IndexSpace,ind];
SpaceQ[space_]:=MemberQ[IndexSpace,IndexAbs@space];
BasisFormQ[arg_]:=MemberQ[CoordSpace[All,"BasisForm"],arg];
BasisVectorQ[arg_]:=MemberQ[CoordSpace[All,"BasisVector"],arg];
BasisQ[arg_]:=BasisFormQ[arg]||BasisVectorQ[arg]||MatchQ[arg,basis[_?IndexQ]];
TensorSymbolQ[arg_]:=MatchQ[arg,head_[inds__?IndexQ]/;MemberQ[Keys@TensorValues,head@@Table[_,Length@{inds}]]];

(*Helper functions for index and tensor operations.*)
IndexSign[ind_]:=If[MatchQ[ind,Times[-1,_]],-1,1];
IndexAbs[ind_]:=IndexSign[ind]ind;
IndexSignSpace[ind_]:=IndexSign[ind]IndexSpace[ind];
IndexDim[ind_]:=SpaceDim[IndexSpace[ind]];
SetAttributes[{IndexSign,IndexAbs,IndexSignSpace,IndexLocalize,PrivatizeIndex},Listable];
PrivatizeIndex[ind_]:=IndexSign[ind]Symbol["SimpleTensor`Private`Index`"<>SymbolName@IndexAbs@ind];
TensorIndices[Tensor[ind_,arr_]]:=ind;
TensorArray[Tensor[ind_,arr_]]:=arr;


Options[DefineSpace]={coord->Null,index->Null};
DefineSpace[space_String,dim_Integer?NonNegative,OptionsPattern[]]:=Module[{ind,crd},
(*Generate or use given space indices.*)
ind=OptionValue[index];
If[ind==Null,ind="i"<>space];
If[MatchQ[ind,_String],ind=Table[Symbol[ind<>ToString[i]],{i,0,2dim-1}]];
If[!MatchQ[ind,{___Symbol}],Print["`index` must be a list of symbols or a string."];Abort[]];

(*Generate or use given space coordinates.*)
crd=OptionValue[coord];
If[crd==Null,crd="x"<>space];
If[MatchQ[crd,_String],crd=Table[Symbol[crd<>ToString[i]],{i,0,dim-1}]];
If[!MatchQ[crd,{___Symbol}],Print["`coord` must be a list of symbols or a string."];Abort[]];
If[Length[crd]!=dim,Print["Invalid number of indices: ",Length@crd," given vs ",dim, " needed."];Abort[]];

If[$Verbose,Print["Defining space: ",space," with dimension: ", dim, ", coordinates: ",crd, ", and indices: ", ind]];

(*In case space is being overwritten delete old entries.*)
KeyDropFrom[IndexSpace,PositionIndex[IndexSpace][space]];
CoordSpace=CoordSpace[Select[#Space!=space&]];
KeyDropFrom[TensorValues,Cases[Keys[TensorValues],_[___,space|-space,___]]];

AppendTo[SpaceDim,space->dim];
(*Zero dimensions effectively delete the space.*)
If[dim==0,Return[]];
(*Adding both covariant and contravariant indices.*)
AppendTo[IndexSpace,#->space]&/@ind;
AppendTo[IndexSpace,-#->space]&/@ind;

(*By convention for every coordinate x the corresponding basis form is dx and basis vector is \[Eth]x.*)
AppendTo[CoordSpace,<|"Space"->space,"Coordinate"->#,"BasisForm"->ToExpression["d"<>ToString@#],"BasisVector"->ToExpression["\[Eth]"<>ToString@#]|>]&/@crd;

(*Metric with one top and one bottom indices is always identity.*)
AppendTo[TensorValues,metric[space,-space]->IdentityMatrix[dim]];
AppendTo[TensorValues,metric[-space,space]->IdentityMatrix[dim]];

AppendTo[TensorValues,basis[space]->Normal@CoordSpace[Select[#Space==space&],"BasisForm"]];
AppendTo[TensorValues,basis[-space]->Normal@CoordSpace[Select[#Space==space&],"BasisVector"]];
AppendTo[TensorValues,ToExpression["\[Eth]"<>space][-space]->(\!\(
\*SubscriptBox[\(\[PartialD]\), \(arg\)]#\)&/.({arg->#}&/@crd))];
];


SetTensor[head_Symbol[ind__?IndexQ],array_List]:=
Module[{},
If[$Verbose,Print["Setting tensor: ",head[ind]," to have the following array: ", array]];
If[head===basis||head===\[Eth],Print["Cannot modify the built-in tensor: ", head[ind]];Abort[]];
If[IndexDim/@{ind}!=Take[Dimensions[array],Length[{ind}]],
Print["Invalid dimension of array ",head[ind],": ",Dimensions[array]," given vs ", IndexDim[#]&/@{ind}, " required."];Abort[]
];

AppendTo[TensorValues,IndexSignSpace/@head[ind]-> array];

(*For convenience for metric tensor initialize also other signatures, if they are not already present.*)
If[head===metric,
With[{t=Minus/@IndexSignSpace/@head[ind]},
If[!MemberQ[Keys@TensorValues,t],AppendTo[TensorValues,t->Transpose@Inverse@array]]];
With[{t=IndexSignSpace/@Reverse@head[ind]},
If[!MemberQ[Keys@TensorValues,t],AppendTo[TensorValues,t->Transpose@array]]];
With[{t=Minus/@IndexSignSpace/@Reverse@head[ind]},
If[!MemberQ[Keys@TensorValues,t],AppendTo[TensorValues,t->Inverse@array]]];
];
];


GetArray[expr_,Optional[indices_List,Null]]:=Module[{res,ind},
If[$Verbose,Print["Getting array of the expression: ",expr," with indices order: ",If[indices=!=Null,indices,"standard"]]];
res=ToTensor[expr];
If[!MatchQ[res,_Tensor],
If[indices===Null||indices==={},Return@res,Print["Cannot return tensor with indices: ",indices," from the scalar: ",res];Abort[]]
];
ind=If[indices=!=Null,indices,Sort@TensorIndices@res];
res=TensorPermute[res,ind];
TensorArray@res
];


(*Calculates the array of the tensor head with the signature sp via the shortest path to an already defined tensor.*)
GetTensorArray[head_Symbol[sp__?SpaceQ]]:=Module[{need,have,res,path,mods},
If[$Verbose,Print["Calculating the tensor array of: ",head[sp]]];
res=TensorValues[head[sp]];
(*If signature already present return it.*)
If[!MissingQ[res],Return@res];

have=Cases[Keys@TensorValues,head[i__]/;Length@{i}===Length@{sp}];
If[have=={},Print["Tensor not found: ",head[sp]];Abort[]];
need=head[sp];
path=ShortestSpacePath[need,have];
(*Contract metrics to get one transformation matrix for each index in 'sp'.*)
mods=Apply[Dot][TensorValues[metric[First@#,-Last@#]]&/@Partition[#,2,1]]&/@path;
res=TensorValues[head@@(Last/@path)];
(*Map each transformation on the correct level in array.*)
MapIndexed[
If[MatchQ[#1,_List],
res=TensorContract[#1\[TensorProduct]res,{{2,2+First[#2]}}];
res=Transpose[res,RotateRight@Range[First@#2]];
]&
,mods];
res
];

(*A helping function to find the shortest path through metrics and basis changes from tensor need to a list of tensors have by building the graph of all space transformations.*)
ShortestSpacePath[need_,have_List]:=Module[{vertices,edges,graph,paths},
vertices=Flatten[{#,-#}&/@Keys@SpaceDim];
edges=Cases[Keys@TensorValues,metric[__]]/.metric[a_,b_]:>(-a\[DirectedEdge]b);
graph=Graph[vertices,edges,VertexLabels->"Name"];
If[$Verbose,Print["Using the following space transformation graph: "];Print[graph]];

paths=Transpose[{List@@need,List@@#}]&/@have;
paths=Map[Apply@FindShortestPath[graph],paths,{2}];
paths=DeleteCases[paths,{}&/@List@@need];
If[paths==={},
Print["Unable to get the tensor array for: ",need];Abort[]];
First@MinimalBy[paths,Length@Flatten]
];

(*Permutes the array in the tens object into the order specified by ind.*)
TensorPermute[tens_Tensor,{ind___?IndexQ}]:=Module[{tensInd,tensArr,perm},
If[$Verbose,Print["Permuting: ",tens," into order: ",{ind}]];
tensInd=TensorIndices[tens];
tensArr=TensorArray[tens];
If[Sort[{ind}]=!=Sort[tensInd],
Print["Indices asked: ",{ind}," differ from indices present: ",tensInd];Abort[]];
perm=Table[First@FirstPosition[{ind},tensInd[[i]]],{i,1,Length@{ind}}];
If[Length[perm]!=0,
Tensor[{ind},Transpose[tensArr,perm]],
Tensor[{ind},tensArr]]
];

(*Pairs the indices in ind and returns the list of free indices and the list of dummy indices.*)
PairIndices[{ind___?IndexQ}]:=Module[{freeRes,dummyRes,invalidIndices},
freeRes=ReverseSort/@GatherBy[{ind},Abs];
dummyRes={};
invalidIndices=Cases[freeRes,e_/;(Length[e]>2||Length[e]==2&&e[[1]]/e[[2]]!=-1)];
If[invalidIndices!={},Print["Invalid indices: ",invalidIndices];Abort[]];
freeRes=If[Length[#]==1,First@#,AppendTo[dummyRes,First@#];Nothing]&/@freeRes;
invalidIndices=DeleteCases[GatherBy[freeRes~Join~dummyRes,Abs],e_/;Length[e]==1];
If[invalidIndices!={},Print["Invalid indices: ",invalidIndices];Abort[]];
{freeRes,dummyRes}
];


(*Transforms expr into a Tensor[inds, array] object or a scalar.*)
ToTensor[expr_]:=Module[{res},
If[$Verbose,Print["Transforming ToTensor: ",expr]];
(*For all tensors of the form t[inds] in the expr substitutes them with the Tensor[inds, array] object, where the array is found from TensorValues. Mathematica then automatically applies algebraic rules to the expression until it is totally converted into a single Tensor object or a scalar.*)
res=expr/.head_Symbol[ind__?IndexQ]/;MemberQ[Keys@TensorValues,el_head/;Length[el]===Length[{ind}]]:>Tensor[{ind},GetTensorArray[head@@IndexSignSpace[{ind}]]];
If[MatchQ[res,_Tensor]||FreeQ[res,_Tensor],res,Print["Failed to bring ToTensor: ",res];Abort[]]
];

(*Tensor object with no indices is just a scalar.*)
Tensor[{},array_]:=array;

(*Defines additive rules for any expressions with a Tensor object.*)
Map[Function[{operation},Tensor/:operation[a___,t__Tensor,z___]:=Module[{tmp,ind},
tmp=Inactive[operation][a,t,z];
If[!AllTrue[tmp,MatchQ[_Tensor]],
Print["Non-tensor expression dected in a sum: ",tmp];Abort[]];
If[$Verbose,Print["Summing tensors: ",tmp]];
ind=TensorIndices@t;
(*Permute all addends to the same index order and extract arrays.*)
tmp=(TensorArray@TensorPermute[#,ind])&/@tmp;
(*Add the corresponding arrays.*)
tmp=Activate@tmp;
Tensor[ind,tmp]
]],{Plus,Complex,TensorPlus}];

(*Defines multiplicative rules for any expressions with a Tensor object.*)
Map[Function[{operation},Tensor/:operation[a___,t__Tensor,z___]:=Module[{tmp,free,dummy},
tmp=Inactive[operation][a,t,z];
If[$Verbose,Print["Multiplying tensors: ",tmp]];
{free,dummy}=PairIndices[Join@@Cases[tmp,el_Tensor:>TensorIndices@el]];
(*Transform each Tensor[ind, arr] into `arr[[ind]]`*)
tmp=tmp/.Tensor[ind_,arr_]:>Inactive[Part][arr,Sequence@@PrivatizeIndex@IndexAbs[ind]];
(*Sum over the dummy variables.*)
tmp=If[Length[dummy]==0,tmp,
With[{ind=Sequence@@({PrivatizeIndex[#],IndexDim[#]}&/@IndexAbs[dummy])},Sum[tmp,ind]]];
(*Arrange what is left into one array.*)
tmp=If[Length[free]==0,tmp,With[{ind=Sequence@@({PrivatizeIndex[#],IndexDim[#]}&/@IndexAbs[free])},Table[tmp,ind]]];
(*Perform remaining multiplicative operations.*)
tmp=Activate@tmp;
Tensor[free,tmp]
]],{Times,Dot,DirectProduct,WedgeProduct,InteriorProduct}];

(*Defines some elementwise operations on a tensor.*)
Map[Function[{operation},Tensor/:operation[args1___?(FreeQ[_Tensor]),t_Tensor,args2___?(FreeQ[_Tensor])]:=Module[{ind,arr},
If[$Verbose,Print["Performing elementwise operation: ",Inactive[operation][args1,t,args2]]];
ind=TensorIndices@t;
arr=Map[operation[args1,#,args2]&,TensorArray@t,{Length@ind}];
Tensor[ind,arr]
]],{Tr,D,ExteriorDerivative}];

(*Defines anti-threading rules for a Tensor object, i.e., transforms a list of tensors into a tensor of lists. Note that Inactive[List][a,z] protects from applying this same function recursively in pattern checking.*)
Tensor/:List[a___,t_Tensor,z___]/;AllTrue[Inactive[List][a,z],MatchQ[Tensor[TensorIndices@t,_List]|0]]:=Module[{tmp,dims},
tmp=Inactive[List][a,t,z];
If[$Verbose,Print["Anti-threading: ",tmp]];
dims=Dimensions[TensorArray@t];
tmp=If[#=!=0,TensorArray@#,Array[0&,dims]]&/@tmp;
tmp=List@@tmp;
tmp=With[{n=Length@TensorIndices@t},Transpose[tmp,Cycles@{Reverse@Range[n+1]}]];
Tensor[TensorIndices@t,tmp]
];

(*Defines rules for tensor operators acting on expr.*)
Tensor[ind_List,arr_List][expr_]:=Module[{},
If[$Verbose,Print["Pulling Through the tensor: ",Inactive[Tensor][ind,arr][expr]]];
Tensor[ind,arr/.f_Function:>f[expr]]
];

(*Flattens tensor of tensors.*)
Tensor[ind1_List,Tensor[ind2_List,arr_List]]:=Module[{},
If[$Verbose,Print["Joining the tensors: ",Inactive[Tensor][ind1,Tensor[ind2,arr]]]];
Tensor[ind2~Join~ind1,arr]
];

(*Contracts indices in a tensor.*)
Tensor[ind_List,arr_List]/;!DuplicateFreeQ[ind,Abs[#1]===Abs[#2]&]:=Module[{free,dummy},
If[$Verbose,Print["Contracting indices in the tensor: ",Inactive[Tensor][ind,arr]]];
{free,dummy}=PairIndices[ind];
dummy=(Join@@Position[ind,#|-#,{1}])&/@dummy;
Tensor[free,TensorContract[arr,dummy]]
];


(*TensorPlus of scalars is just a sum of scalars.*)
TensorPlus[args__?(FreeQ[_Tensor|_Symbol[__?IndexQ]])]:=Plus[args];

(*Defining a shortcut to simply use \[Eth][\[PlusMinus]ind] instead of \[Eth]space[\[PlusMinus]ind] for obvious choice of space.*)
\[Eth][ind_?IndexQ]:=ToExpression["\[Eth]"<>IndexSpace[ind]][ind];



(*DirectProduct is a non-commutative, listable, flat, linear operation.*)
DirectProduct[arg_]:=arg;
DirectProduct[a___,x_+y_,z___]:=DirectProduct[a,x,z]+DirectProduct[a,y,z];
DirectProduct[a___,s_*x_,z___]/;FreeQ[s,_?BasisQ]:=s*DirectProduct[a,x,z];
SetAttributes[DirectProduct,{Listable,OneIdentity,Flat}];

(*WedgeProduct is a listable, flat, linear, anti-symmetric, operation.*)
(*Default[WedgeProduct]:=1;*)
WedgeProduct[arg_]:=arg;
WedgeProduct[a___,x_+y_,z___]:=WedgeProduct[a,x,z]+WedgeProduct[a,y,z];
WedgeProduct[a___,s_*x_,z___]/;FreeQ[s,_?BasisQ]:=s WedgeProduct[a,x,z];
WedgeProduct[a___?BasisFormQ,f_?BasisFormQ,m___?BasisFormQ,f_,z___?BasisFormQ]:=0;
WedgeProduct[args__?BasisFormQ]/;!OrderedQ[{args}]:=Signature[{args}]WedgeProduct@@Sort[{args}];
SetAttributes[WedgeProduct,{Listable,OneIdentity,Flat}];


(*If no space is specified the derivative is taken in a product space of all defined spaces.*)
ExteriorDerivative[][expr_]:=
ExteriorDerivative[Sequence@@DeleteDuplicates@Normal@CoordSpace[All,"Space"]][expr];

(*If taken in a product space take the derivative in all spaces independently and then add.*)
ExteriorDerivative[spaces__?SpaceQ][expr_]/;Length[{spaces}]>1:=
ExteriorDerivative[#][expr]&/@Plus[spaces];

(*ExteriorDerivative is linear.*)
ExteriorDerivative[space_?SpaceQ][x_+y_]:=
ExteriorDerivative[space][x]+ExteriorDerivative[space][y];

(*ExteriorDerivative works with expanded arguments.*)
ExteriorDerivative[space_?SpaceQ][x_*y_Plus]:=
ExteriorDerivative[space][Expand[x*y]];

ExteriorDerivative[space_?SpaceQ][s_|s_.*x_WedgeProduct|s_.*x_DirectProduct|s_.*x_?BasisQ]/;FreeQ[s,_WedgeProduct|_DirectProduct|_?BasisQ|_?TensorSymbolQ]:=Module[{coord,basis},
coord=CoordSpace[Select[#Space==space&],"Coordinate"]//Normal;
basis=CoordSpace[Select[#Space==space&],"BasisForm"]//Normal;
Sum[D[s,coord[[i]]]WedgeProduct[basis[[i]], x ],{i,1,Length@coord}]
]


(*InteriorProduct is symmetric.*)
SetAttributes[InteriorProduct,Orderless];

(*InteriorProduct is linear.*)
InteriorProduct[s_,z_]/;FreeQ[s,_?BasisQ]:=s z;
InteriorProduct[s_*x_,z_]/;FreeQ[s,_?BasisQ]:=s InteriorProduct[x,z];
InteriorProduct[x_+y_,z_]:=InteriorProduct[x,z]+InteriorProduct[y,z];

(*InteriorProduct of a basis vector and a basis form is a Kronecker delta.*)
InteriorProduct[v_?BasisVectorQ,f_?BasisFormQ]:=Length[CoordSpace[Select[#BasisVector==v&&#BasisForm==f&]]];

InteriorProduct[DirectProduct[x_?BasisQ,y_],z_]:=InteriorProduct[y,InteriorProduct[x,z]];
InteriorProduct[DirectProduct[x_,y_],z_?BasisQ]:=DirectProduct[InteriorProduct[x,z],y];
InteriorProduct[w_WedgeProduct,z_?BasisQ]:=Sum[(-1)^(1+i) InteriorProduct[#1,z]#2&@@TakeDrop[w,{i}],{i,Length[w]}]


End[]

EndPackage[]

