//===- basic_block.cc -----------------------------------------------------===//
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

#include "halo/lib/ir/basic_block.h"

#include "halo/lib/ir/common_instructions.h"
namespace halo {

ReturnInst* BasicBlock::GetReturnInst() const {
  for (auto it = instructions_.rbegin(), ie = instructions_.rend(); it != ie;
       ++it) {
    if ((*it)->GetOpCode() == OpCode::RETURN) {
      return DynCast<ReturnInst>(it->get());
    }
  }
  return nullptr;
}

void BasicBlock::Print(std::ostream& os) const {
  os << "BasicBlock: " << GetName() << "(";
  int arg_idx = 0;
  for (auto& arg : Args()) {
    if (arg_idx++ != 0) {
      os << ", ";
    }
    arg->Print(os);
  }
  os << ")\n";

  for (auto& c : Constants()) {
    c->Print(os);
  }
  for (const auto& inst : *this) {
    inst->Print(os);
  }
}

} // namespace halo
