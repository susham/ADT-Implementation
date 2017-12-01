# Programming Languages Assignment 9: Implement ADT using Swift


The goal of the assignment is to implement below ADT to learn how swift supports the concept of abstract data types (ADTs).

type dict<V>
operations:
empty : unit -> dict<V>
lookup : dict<V> -> string -> (V + NotFound)
insert : dict<V> -> string -> V -> unit
fold : dict<V> -> <T> -> (<T> -> string -> V -> <T>) -> <T>
  
  
Here empty() yields a new empty dictionary. Operation lookup d s yields the value in dictionary d corresponding
to string key s, if any; V + NotFound is a disjoint union containing either a V value or a NotFound flag. Operation
insert d s v updates dictionary d to map key s to value v; if key s is already present the dictionary, subsequent
lookup and fold operations should only see the new value v for that key. Operation fold d a f computes
f(...(f(f(f a k1 v1) k2 v2) k3 v3)...) kn vn
where the ki and vi are the keys and corresponding values in d, taken in arbitrary order. If d is empty, the fold returns
the value a. If f mutates d, the results of the fold are unspecified (i.e., clients should not use such an f, and an
implementation of this ADT can do whatever it wants if the client does use such an f).



In the Swift programming language, protocols are similar to interfaces in Java. Hence we have defined below protocol
protocol ADTDict {
    associatedtype V
    func insert(key:String,value:V) throws
    func lookup(key:String) throws-> V?
    
}

The original ADT has the Fold function, but we have not defined the fold function in our protocol, since the protocols doesn't allow generic functions fold<A> which allows to take the type throught function call rather than from the class<V>. Hence we have created the generic fold function in protocols implementation class. 

##############################################################################################################################
After downloading the files, 
Below are the Steps for Executing swift program in Linux environment:

1 -> Copy our source files to any of the directory (Ex. Downloads/Assignment9)

2 -> In the terminal, run the command to set up the path to execute swift program  

		export PATH=/u/apt/swift/bin/:$PATH

3 -> Now change directory to the directory where source code files are placed.

4 -> To compile these files, use following command	

		swiftc *.swift -o Assignment9

5 -> Run Executables using following command

		./Assignment9




