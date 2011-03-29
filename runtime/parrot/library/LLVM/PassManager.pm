class LLVM::PassManager is LLVM::Opaque {
    # List of available passes as of llvm-2.7
    our %PASS := hash(
        AAEvalPass                      => 1,
        AggressiveDCEPass               => 1,
        AliasAnalysisCounterPass        => 1,
        AliasDebugger                   => 1,
        ArgumentPromotionPass           => 1,
        StructRetPromotionPass          => 1,
        BasicAliasAnalysisPass          => 1,
        LibCallAliasAnalysisPass        => 1,
        ScalarEvolutionAliasAnalysisPass=> 1,
        BlockPlacementPass              => 1,
        BreakCriticalEdgesPass          => 1,
        CFGSimplificationPass           => 1,
        ConstantMergePass               => 1,
        ConstantPropagationPass         => 1,
        DeadArgEliminationPass          => 1,
        DeadCodeEliminationPass         => 1,
        DeadInstEliminationPass         => 1,
        DeadStoreEliminationPass        => 1,
        DeadTypeEliminationPass         => 1,
        DomOnlyPrinterPass              => 1,
        DomPrinterPass                  => 1,
        DomOnlyViewerPass               => 1,
        DomViewerPass                   => 1,
        EdgeProfilerPass                => 1,
        OptimalEdgeProfilerPass         => 1,
        FunctionInliningPass            => 1,
        AlwaysInlinerPass               => 1,
        GlobalDCEPass                   => 1,
        GlobalOptimizerPass             => 1,
        GlobalsModRefPass               => 1,
        IPConstantPropagationPass       => 1,
        IPSCCPPass                      => 1,
        IndVarSimplifyPass              => 1,
        InstructionCombiningPass        => 1,
        InternalizePass                 => 1,
        LCSSAPass                       => 1,
        LICMPass                        => 1,
        LazyValueInfoPass               => 1,
        LiveValuesPass                  => 1,
        LoopDependenceAnalysisPass      => 1,
        LoopExtractorPass               => 1,
        LoopSimplifyPass                => 1,
        LoopStrengthReducePass          => 1,
        LoopUnrollPass                  => 1,
        LoopUnswitchPass                => 1,
        LoopRotatePass                  => 1,
        LoopIndexSplitPass              => 1,
        LowerInvokePass                 => 1,
        LowerSetJmpPass                 => 1,
        LowerSwitchPass                 => 1,
        NoAAPass                        => 1,
        NoProfileInfoPass               => 1,
        ProfileEstimatorPass            => 1,
        ProfileVerifierPass             => 1,
        ProfileLoaderPass               => 1,
        PromoteMemoryToRegisterPass     => 1,
        DemoteRegisterToMemoryPass      => 1,
        PruneEHPass                     => 1,
        PostDomOnlyPrinterPass          => 1,
        PostDomPrinterPass              => 1,
        PostDomOnlyViewerPass           => 1,
        PostDomViewerPass               => 1,
        ReassociatePass                 => 1,
        SCCPPass                        => 1,
        ScalarReplAggregatesPass        => 1,
        SimplifyLibCallsPass            => 1,
        SimplifyHalfPowrLibCallsPass    => 1,
        SingleLoopExtractorPass         => 1,
        StripSymbolsPass                => 1,
        StripNonDebugSymbolsPass        => 1,
        StripDeadPrototypesPass         => 1,
        TailCallEliminationPass         => 1,
        TailDuplicationPass             => 1,
        JumpThreadingPass               => 1,
        UnifyFunctionExitNodesPass      => 1,
        InstCountPass                   => 1,
        CodeGenPreparePass              => 1,
        GVNPass                         => 1,
        MemCpyOptPass                   => 1,
        LoopDeletionPass                => 1,
        PostDomTree                     => 1,
        PostDomFrontier                 => 1,
        InstructionNamerPass            => 1,
        PartialSpecializationPass       => 1,
        FunctionAttrsPass               => 1,
        MergeFunctionsPass              => 1,
        PrintModulePass                 => 1,
        PrintFunctionPass               => 1,
        DbgInfoPrinterPass              => 1,
        PartialInliningPass             => 1,
        SSIPass                         => 1,
        SSIEverythingPass               => 1,
        GEPSplitterPass                 => 1,
        SCCVNPass                       => 1,
        ABCDPass                        => 1,
    );

    # Optimizations used by default
    our @DEFAULT_OPTIMIZATIONS := <
        ConstantPropagationPass
        InstructionCombiningPass
        PromoteMemoryToRegisterPass
        GVNPass
        CFGSimplificationPass
        FunctionInliningPass
    >;

    method create(:$optimize?) {
        my $res := self.new.wrap(LLVM::call("CreatePassManager", ));

        if $optimize {
            $res.add($_) for @DEFAULT_OPTIMIZATIONS;
        }

        $res;
    }

    method DESTROY() {
        LLVM::call("DisposePassManager", self);
    }

    multi method add(Str $name) {
        my $m := %LLVM::F{"Add" ~ $name};
        pir::die("Unknown pass $name") unless pir::defined($m);
        $m(self);
    }

    multi method run(LLVM::Module $module) {
        LLVM::call("RunPassManager", self, $module);
    }
}

# vim: ft=perl6
