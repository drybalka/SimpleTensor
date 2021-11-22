# SimpleTensor
User-friendly Mathematica package for elementary tensor and differential geometric calculations.

### Supporting publication
The detailed description and example session file with comments can be found in the [supporting publication](https://arxiv.org/pdf/2111.06718) on arxiv.

### Motivation
Wolfram Mathematica is a popular symbolic computation program useful among other applications in physics computations.
Standard Mathematica functions fulfill almost all mathematical needs of typical undergraduate level courses.
The most obvious exception to that is tensor calculus and differential geometry. 

There already exist a few packages intended to provide this functionality, for example, xAct, TensoriaCalc, grt, Ricci just to name a few.
However, in my opinion, they all suffer from one or more of the following flows:
- The package is old, outdated, or not supported anymore;
- The package is hard to master (or even to grasp), as it contains dozens or even hundreds public functions;
- The package is focused primarily at the General Relativity computations;
- The package is hard to modify for your personal needs.

As the name suggests, SimpleTensor is intended to remedy these flows by being up-to-date, concise (only 11 public functions), all-purpose, and well-documented (hackable).
It also provides basis for elementary in-basis differential geometric computations.
On the other hand, some sacrifices had to be made in order to achieve these goals and so SimpleTensor loses on speed and number of readily available functions for GR to its competitors.

### Installation
To install the package copy the [SimpleTensor.m](SimpleTensor.m) file to the Applications folder in your `$UserBaseDirectory`.
The package can then be loaded as any other Mathematica package with ``Needs["SimpleTensor`"]``.
Alternatively, if you would like to modify anything, you can simply edit and execute the content of [SimpleTensor.nb](SimpleTensor.nb) file.

### Usage
To help with the familiarization in this repository also added a [test file](SimpleTensor_test.nb) and a documented [example session file](SimpleTensor_example.nb).
The latter shows the most useful applications of SimpleTensor on the examples of electromagnetism, quantum mechanics of Dirac particles and chiral kinetic theory.
The former helps to understand the edge cases and can also be used to check user-made modifications.

As a convention we consider indices `i` and `-i` to be contravariant (top) and covariant (bottom) forms of the same index respectively.
Here is the short info on each public function in SimpleTensor:

- `DefineSpace[name, dim]` defines a space of dimension `dim` with a string `name` on which tensor calculations will be performed. The optional variables are:
  - `index` - a list of indices on this space or a string prefix to generate names automatically, if missing name is used as a prefix;
  - `coord` - a list of coordinates on this space or a string prefix to generate names automatically, if missing name is used as a prefix.

- `SetTensor[t[µ], arr]` associates array `arr` to a tensor `t[µ]`. For convenience this function overrides the built-in Congruent function. To change the default behavior edit corresponding lines in the package file.

- `GetArray[expr]` substitutes arrays into tensor variables and performs contractions and math operations. The optional variables are:
  - `indices` - a list of indices in which order the tensor should be transposed. If omitted indices are taken to be in standard order, i.e., the one returned by the standard `Sort[]` function.

- `metric[-i1, -i2]` is the metric tensor for the space in which `i1` and `i2` are defined. 
`metric[i1, i2]` is the inverse metric tensor. If `i1` and `i2` belong to different spaces then it works as a tetrad (vielbein) tensor and represents the change of basis.

- `basis[i]` is the tensor of basis forms for the space in which index `i` is defined.
`basis[-i]` is the tensor of basis vectors.

- `ð[±i]` is the tensor derivative for the space in which index `i` is defined. 
`ðspace[±i]` is also defined for a derivative in the space space, which can be used with any `i`.

- `TensorPlus[args]` is used to add matrix-valued tensors (for example, the set of Dirac matrices `γ[µ]`) with explicit lists (for example, `IdentityMatrix[4]`). It is equivalent to `Plus[]` in most cases, except it prevents the automatic threading over lists. For convenience this function overrides the built-in `CirclePlus` function.


- `DirectProduct[args]` represents the tensor product of basis vectors and forms. It expands `args` automatically until a sum of basis tensor products is achieved. For convenience this function overrides the built-in `CircleTimes` function.

- `WedgeProduct[args]` represents the wedge product of basis forms. It expands `args` automatically until a sum of basis wedge products is achieved. For convenience this function overrides the built-in `Wedge` function.

- `ExteriorDerivative[space][expr]` gives the exterior derivative of `expr` in `space`. If latter is a Sequence of spaces, the exterior derivative is taken in their product space. If `space` is empty, the exterior derivative is taken in the product space of all defined spaces.

- `InteriorProduct[expr1, expr2]` is the symmetric interior product of basis vectors and forms in `expr1` and `expr2`. The DirectProducts of basises are multiplied successively starting from the first position.
