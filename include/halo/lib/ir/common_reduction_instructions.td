//===- common_reduction_instructions.td ----------------------*- tblgen -*-===//
//
// Copyright (C) 2019-2020 Alibaba Group Holding Limited.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// =============================================================================

#ifdef INSTRUCTION_BASE
#else
include "instruction_base.td"
#endif

let cat_ = cat_common_reduction,
    attrs_ = [Attr<"Axis along which to reduce, omitted if X2 exists.",
                   IntegerList, "axis">,
              Attr<"Indicate whether to keep the reduced dimension.",
                   Bool, "keep_dims", "true">],
    outs_ = [Arg<"The result", MatchArgType<0> >] in {

  let ins_ = [Arg<"The input.", ArgType<[I8,I16,I32,F16,F32]> >,
              OptionalArg<"The axis.", ArgType<[I32]>, 1D>] in {

    def ReduceL1 : Inst<"Computes the L1 norm of the elements across"
                        " dimensions.">;

    def ReduceL2 : Inst<"Compute the L2 norm of the elements across"
                        " dimensions.">;

    def ReduceLogSum : Inst<"Compute the log sum of the elements across"
                            " dimensions.">;

    def ReduceLogSumExp : Inst<"Compute the log sum exp of the elements across"
                               " dimensions.">;

    def ReduceSumSquare : Inst<"Compute the log sum of the elements across"
                               " dimensions.">;

    def ReduceMax : Inst<"Compute the maximum of the elements across"
                         " dimensions">;

    def ReduceMean : Inst<"Compute the average of the elements across"
                          " dimensions.">;

    def ReduceMin : Inst<"Compute the minimum of the elements across"
                         " dimensions">;

    def ReduceProduct : Inst<"Compute the product of the elements across"
                             " dimensions">;

    def ReduceSum : Inst<"Compute the sum of the elements across"
                         " dimensions">;
  }

  /* def ReduceAll : Inst<"Compute the logical AND of the elements across"
                       " dimensions."> {
    let ins_ = [Arg<"The input.", ArgType<[I1]> >,
                OptionalArg<"The axis.", ArgType<[I32]>, 1D>];
  }*/
}

let cat_ = cat_common_reduction,
    attrs_ = [Attr<"Axis along which to reduce.", Integer, "axis", "0">,
              Attr<"Indicate whether to keep the reduced dimension.",
                   Bool, "keep_dims", "true">],
    ins_ = [Arg<"The input.", ArgType<[I8,I16,I32,F16,F32]> >,
            OptionalArg<"The axis.", ArgType<[I32]>, 0D>],
    outs_ = [Arg<"The result", ArgType<[I32]> >] in {

  def Argmax : Inst<"Computes the indices of the largest value of the input"
                    " along the specified axis.">;

  def Argmin : Inst<"Computes the indices of the smallest value of the input"
                    " along the specified axis.">;

}
