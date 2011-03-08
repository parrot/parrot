
.include "runtime/parrot/library/LLVM.pir"
.include "runtime/parrot/library/LLVM/Opaque.pir"
.include "runtime/parrot/library/LLVM/BasicBlock.pir"
.include "runtime/parrot/library/LLVM/Builder.pir"
.include "runtime/parrot/library/LLVM/Constant.pir"
.include "runtime/parrot/library/LLVM/Context.pir"
.include "runtime/parrot/library/LLVM/Function.pir"
.include "runtime/parrot/library/LLVM/Module.pir"
.include "runtime/parrot/library/LLVM/Type.pir"
.include "runtime/parrot/library/LLVM/Value.pir"

.namespace ['LLVM';'Opaque']
.sub '' :vtable('get_pointer') :method
    $P0 = self.'unwrap'()
    $I0 = get_addr $P0
    .return ($I0)
.end
