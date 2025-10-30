pragma solidity 0.8.24;

// Initial test replay generated from Echidna log at https://getrecon.xyz/tools/echidna
// Assume EchidnaTestRaces.sol is the Echidna harness contract that defines the methods registerMembership,
// attemptExtensionRace, attemptErasureRace.
import "./EchidnaTestRaces.t.sol";
import "forge-std/Test.sol";

contract EchidnaReplayRaces is Test {
    EchidnaTestRaces internal echidna;

    function setUp() public {
        echidna = new EchidnaTestRaces();
    }

    function test_attemptErasureRace_WakuRLN() public {
        vm.roll(block.number + 11_796);
        vm.warp(block.timestamp + 5_474_623);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            // Valid Baby Jubjub point x
            9_232_262_805_086_961_470_140_171_118_068_527_502_773_883_397_953_635_627_654_272_948_280_162_222_460,
            // Reduced duration
            100
        );
        vm.roll(block.number + 47_085);
        vm.warp(block.timestamp + 9_714_873);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            // Valid Baby Jubjub point y (used as x for variety)
            1_146_454_861_477_987_609_722_193_068_493_335_872_063_213_810_781_901_067_275_896_485_680_154_245_472,
            // Reduced duration
            100
        );
        vm.roll(block.number + 38_103);
        vm.warp(block.timestamp + 4_558_906);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            // From signature R x
            21_166_949_849_736_108_178_593_290_733_041_673_195_425_050_355_037_214_376_832_942_606_083_908_688_572,
            // Reduced duration
            100
        );
        vm.roll(block.number + 29_746);
        vm.warp(block.timestamp + 13_228_720);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            // From signature R y
            5_042_557_814_597_858_929_471_199_758_284_795_017_757_988_233_023_087_832_786_942_557_701_125_530_716,
            // Reduced duration
            100
        );
        vm.roll(block.number + 58_772);
        vm.warp(block.timestamp + 16_726_535);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_933
        );
        vm.roll(block.number + 48_493);
        vm.warp(block.timestamp + 1_204_344);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            28_231_738_780_016_212_060_605_121_782_152_175_650_399_916_271_686_623_479_564_981_844_592_372_633_495
        );
        vm.roll(block.number + 36_902);
        vm.warp(block.timestamp + 6_674_673);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            14_271_763_308_400_718_165_336_499_097_156_975_241_954_733_520_325_982_997_864_342_600_795_471_836_727
        );
        vm.roll(block.number + 33_845);
        vm.warp(block.timestamp + 735_716);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            9_999_044_003_322_463_509_208_400_801_275_356_671_266_978_396_985_433_172_455_084_837_770_460_579_628
        );
        vm.roll(block.number + 35_781);
        vm.warp(block.timestamp + 15_419_955);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(
            14_868_750_298_864_215_918_931_212_669_461_480_940_838_279_805_163_953_554_392_700_481_114_788_988_217
        );
        vm.roll(block.number + 771);
        vm.warp(block.timestamp + 17_913_418);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(15_552_001, false);
        vm.roll(block.number + 18_055);
        vm.warp(block.timestamp + 13_187_508);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            4_498_454_914_711_882_268_466_328_398_075_690_403_183_913_761_650_565_928_933_850_043_231_959_582_090
        );
        vm.roll(block.number + 44_293);
        vm.warp(block.timestamp + 11_359_790);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(8_816_298_471_565_553_478_253);
        vm.roll(block.number + 53_425);
        vm.warp(block.timestamp + 4_444_562);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            745_203_718_271_072_817_124_702_263_707_270_113_474_103_371_777_640_557_877_379_939_715_613_501_666
        );
        vm.roll(block.number + 33_562);
        vm.warp(block.timestamp + 14_219_475);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            106_881_024_749_878_243_321_292_280_200_974_139_959_817_939_173_788_106_633_056_826_054_874_002_347_673,
            false
        );
        vm.roll(block.number + 51_795);
        vm.warp(block.timestamp + 16_733_054);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            810_181_532_076_738_148_308_457_416_289_197_585_577_119_693_706_380_535_394_811_298_325_092_337_779, true
        );
        vm.roll(block.number + 52_386);
        vm.warp(block.timestamp + 13_340_960);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(
            39_191_598_377_141_549_315_856_730_925_567_207_940_583_071_046_522_612_928_475_157_163_375_553_445_883,
            false
        );
        vm.roll(block.number + 28_778);
        vm.warp(block.timestamp + 19_485_372);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            422_974_903_473_869_924_285_294_686_399_247_660_575_841_594_104_291_551_918_957_116_218_939_002_862
        );
        vm.roll(block.number + 53_838);
        vm.warp(block.timestamp + 1);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            93_069_777_957_716_534_626_511_592_676_095_128_883_541_549_173_304_417_502_211_440_887_097_265_352_764, 100
        );
        vm.roll(block.number + 46_636);
        vm.warp(block.timestamp + 11_821_678);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            51_522_906_060_057_278_679_990_947_101_404_412_153_472_957_736_268_514_263_884_637_927_398_269_578_188, 100
        );
        vm.roll(block.number + 57_888);
        vm.warp(block.timestamp + 11_470_172);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            61_542_542_599_287_154_647_970_081_191_182_610_995_985_456_890_733_246_815_310_689_354_155_913_446_715, 100
        );
        vm.roll(block.number + 53_678);
        vm.warp(block.timestamp + 1_059_409);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            15_151_206_851_768_761_922_626_779_419_716_885_032_550_609_243_972_739_304_354_508_404_025_123_978_483, 100
        );
        vm.roll(block.number + 9163);
        vm.warp(block.timestamp + 5_088_962);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            14_081_762_237_856_300_239_452_543_304_351_251_708_585_712_948_734_528_663_957_353_575_674_639_038_360, 100
        );
        vm.roll(block.number + 57_370);
        vm.warp(block.timestamp + 7_211_971);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            108_963_296_912_626_303_058_593_673_031_410_359_103_080_213_800_576_845_606_511_577_526_451_809_781_764, 100
        );
        vm.roll(block.number + 52_325);
        vm.warp(block.timestamp + 7_269_956);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            59_854_361_444_067_331_214_800_449_562_275_531_518_062_284_755_304_292_849_816_766_824_186_269_102_025, 100
        );
        vm.roll(block.number + 13);
        vm.warp(block.timestamp + 11_809_403);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            30_515_202_238_888_354_901_379_804_575_700_505_769_761_565_567_680_891_590_302_236_564_961_093_984_633, 100
        );
        vm.roll(block.number + 50_167);
        vm.warp(block.timestamp + 10_228_636);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(
            907_529_701_442_527_636_822_361_196_151_011_186_835_477_052_160_076_110_045_266_796_422_655_750
        );
        vm.roll(block.number + 32_448);
        vm.warp(block.timestamp + 6_071_296);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptErasureRace(
            36_152_006_575_898_071_413_738_485_534_610_504_772_123_181_747_755_834_736_036_287_698_777_015_184_002,
            false
        );
        vm.roll(block.number + 6729);
        vm.warp(block.timestamp + 5_889_939);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptErasureRace(
            58_463_562_426_656_549_831_725_639_173_426_781_888_371_207_839_773_191_116_779_676_742_569_157_617_676, true
        );
        vm.roll(block.number + 49_403);
        vm.warp(block.timestamp + 14_818_957);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptExtensionRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_932
        );
        vm.roll(block.number + 44_385);
        vm.warp(block.timestamp + 7_821_507);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            111_185_342_898_521_325_588_224_305_609_230_586_551_748_536_155_220_651_814_001_626_697_158_870_944_491,
            false
        );
        vm.roll(block.number + 8138);
        vm.warp(block.timestamp + 3_986_838);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptErasureRace(
            5_563_317_320_536_360_357_019_805_881_367_133_322_562_055_054_443_943_486_481_491_020_841_431_450_882, true
        );
        vm.roll(block.number + 55_495);
        vm.warp(block.timestamp + 13_298_744);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(
            82_150_570_835_311_748_779_613_601_590_930_899_007_637_956_995_391_819_623_786_983_419_155_333_240_346,
            false
        );
        vm.roll(block.number + 53_808);
        vm.warp(block.timestamp + 16_113_649);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            94_756_843_913_980_367_703_825_440_635_606_010_870_107_150_061_183_736_341_168_934_719_085_836_060_272
        );
        vm.roll(block.number + 53_575);
        vm.warp(block.timestamp + 6_685_351);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            22_524_513_599_250_775_770_561_496_810_744_347_426_238_296_396_541_115_644_891_258_189_615_473_070_435,
            false
        );
        vm.roll(block.number + 35_363);
        vm.warp(block.timestamp + 5_418_157);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            89_833_576_623_011_348_753_034_902_489_203_339_405_860_111_267_468_969_771_441_095_409_308_430_642_032, 61
        );
        vm.roll(block.number + 2914);
        vm.warp(block.timestamp + 7_963_431);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            2_555_752_030_748_925_341_265_856_133_642_532_487_884_589_978_209_403_118_872_788_051_695_546_807_405, 20
        );
        vm.roll(block.number + 42_147);
        vm.warp(block.timestamp + 11_043_183);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            114_754_453_626_733_198_273_777_522_719_098_112_979_869_218_458_062_538_485_135_739_426_192_996_542_208, 36
        );
        vm.roll(block.number + 4708);
        vm.warp(block.timestamp + 11_691_783);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            104_896_750_968_454_172_725_482_821_202_386_350_664_629_961_052_485_242_745_091_802_526_249_639_802_019
        );
        vm.roll(block.number + 59_035);
        vm.warp(block.timestamp + 11_364_443);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            46_890_934_969_458_242_237_056_668_330_086_728_522_184_233_411_179_055_912_131_707_524_887_240_413_667, 64
        );
        vm.roll(block.number + 59_751);
        vm.warp(block.timestamp + 6_021_229);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptErasureRace(
            108_620_199_967_090_723_474_583_461_904_654_274_942_825_586_337_549_804_002_848_520_230_944_291_922_140,
            true
        );
    }

    function test_attemptExtensionRace_WakuRLN() public {
        vm.roll(block.number + 59_109);
        vm.warp(block.timestamp + 12_682_314);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            115_710_044_366_489_380_560_145_754_182_836_127_776_606_905_958_965_281_515_627_230_965_944_185_828_197,
            true
        );
        vm.roll(block.number + 35_655);
        vm.warp(block.timestamp + 15_576_565);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            12_439_145_154_143_552_525_910_919_713_868_996_066_330_922_688_700_283_373_718_845_930_110_014_852_748, 100
        );
        vm.roll(block.number + 5763);
        vm.warp(block.timestamp + 6_585_509);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            17_390_757_134_860_691_103_601_339_956_017_953_267_743_470_484_370_144_179_061_550_943_820_859_938_352,
            false
        );
        vm.roll(block.number + 24_311);
        vm.warp(block.timestamp + 12_762_680);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(30_550_828_421_328_047_254_873_089_071_721_340, 100);
        vm.roll(block.number + 12_819);
        vm.warp(block.timestamp + 1_649_692);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(
            104_850_126_800_538_479_521_627_521_813_512_576_589_921_885_869_622_125_078_501_950_362_797_396_775_732
        );
        vm.roll(block.number + 45_108);
        vm.warp(block.timestamp + 1_956_666);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            12_998_355_040_318_813_176_485_525_989_237_675_206_797_591_310_842_198_122_085_618_117_253_610_484_417, 100
        ); // Changed commitment
        vm.roll(block.number + 53_007);
        vm.warp(block.timestamp + 276_592);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(834);
        vm.roll(block.number + 25_848);
        vm.warp(block.timestamp + 11_362_065);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            17_286_222_306_748_121_286_213_072_224_111_296_043_148_465_520_025_078_192_122_982_708_843_485_620_218, 100
        ); // Changed commitment
        vm.roll(block.number + 33_171);
        vm.warp(block.timestamp + 383_675);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            7_022_159_125_197_495_734_384_997_711_896_547_675_021_391_130_223_237_843_255_817_587_255_104_160_363
        );
        vm.roll(block.number + 15_676);
        vm.warp(block.timestamp + 11_735_351);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            101_185_480_181_713_116_242_457_669_701_483_883_593_620_024_991_591_651_269_453_671_853_652_437_478_102
        );
        vm.roll(block.number + 44_384);
        vm.warp(block.timestamp + 18_346_179);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            4_908_416_131_442_887_573_991_189_028_182_614_782_884_545_304_889_259_793_974_797_565_686_968_097_292, 100
        );
        vm.roll(block.number + 16_801);
        vm.warp(block.timestamp + 573_740);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            6_350_874_878_119_819_312_338_956_282_401_532_410_528_162_663_560_392_320_966_563_075_034_087_161_848, 100
        );
        vm.roll(block.number + 35_654);
        vm.warp(block.timestamp + 4_068_035);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptExtensionRace(
            18_978_082_967_849_498_068_717_608_127_246_258_727_629_855_559_346_799_025_101_476_822_814_831_852_169
        );
        vm.roll(block.number + 30_101);
        vm.warp(block.timestamp + 4_745_968);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptExtensionRace(6_106_105_733_994_696_914_590_284_712_692);
        vm.roll(block.number + 6700);
        vm.warp(block.timestamp + 14_763_861);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptExtensionRace(
            104_237_522_040_539_086_529_385_814_200_395_911_913_667_236_478_153_241_258_910_237_150_016_100_933_281
        );
        vm.roll(block.number + 52_780);
        vm.warp(block.timestamp + 16_427_024);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            8_555_773_188_090_352_132_903_209_190_922_658_630_799_967_488_207_010_664_039_959_647_283_030_053_950, 100
        );
        vm.roll(block.number + 36_392);
        vm.warp(block.timestamp + 11_470_167);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            9_394_776_414_966_240_069_580_838_672_673_694_685_292_165_040_808_226_440_647_796_406_499_139_370_962, true
        );
        vm.roll(block.number + 13_355);
        vm.warp(block.timestamp + 16_427_025);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            9_630_707_582_521_938_235_113_899_367_442_877_106_957_117_302_212_260_601_089_037_887_382_200_262_601, false
        );
        vm.roll(block.number + 22_867);
        vm.warp(block.timestamp + 159_999);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            28_243_736_643_972_833_793_366_231_626_843_204_992_644_487_197_555_289_924_254_482_104_591_589_940_922
        );
        vm.roll(block.number + 22_820);
        vm.warp(block.timestamp + 4_779_059);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            19_201_590_924_623_513_311_141_753_466_125_212_569_043_677_014_481_753_075_022_686_585_593_991_810_749, 100
        );
        vm.roll(block.number + 35_266);
        vm.warp(block.timestamp + 3_182_076);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            43_827_548_018_134_037_042_906_582_304_483_527_074_537_881_763_084_930_140_765_111_011_615_661_349_666
        );
        vm.roll(block.number + 19_490);
        vm.warp(block.timestamp + 299_200);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            12_776_298_811_140_222_029_408_960_445_729_157_525_018_582_422_120_161_448_937_390_282_915_768_616_624
        );
        vm.roll(block.number + 51_788);
        vm.warp(block.timestamp + 18_651_487);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(
            107_301_127_263_897_597_227_628_761_122_806_603_306_606_929_334_009_477_725_205_515_511_615_612_118_148,
            true
        );
        vm.roll(block.number + 49_348);
        vm.warp(block.timestamp + 12_337_026);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            14_744_269_619_966_411_208_579_211_824_598_458_697_587_494_354_926_760_081_771_325_075_741_142_829_158, 100
        );
        vm.roll(block.number + 49_829);
        vm.warp(block.timestamp + 12_713_084);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            43_792_367_251_478_649_051_155_053_078_982_380_795_888_842_184_379_994_324_460_592_762_045_082_390_946
        );
        vm.roll(block.number + 7659);
        vm.warp(block.timestamp + 14_763_856);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(828, true);
        vm.roll(block.number + 36_651);
        vm.warp(block.timestamp + 4_476_578);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            115_046_885_519_045_122_606_446_282_744_980_637_739_795_881_293_862_923_481_580_204_068_197_516_138_270,
            false
        );
        vm.roll(block.number + 41_972);
        vm.warp(block.timestamp + 15_765_194);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            7_171_889_270_225_471_948_987_523_104_033_632_910_444_398_328_090_760_036_609_063_776_968_837_717_794, true
        );
        vm.roll(block.number + 12_338);
        vm.warp(block.timestamp + 16_542_398);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            14_931_788_920_454_064_001_300_263_071_209_926_622_155_838_516_781_070_271_701_382_859_038_411_909_782, 100
        ); // Changed commitment
        vm.roll(block.number + 21_241);
        vm.warp(block.timestamp + 1_018_641);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            12_087_805_090_466_257_955_035_297_089_319_786_504_492_879_194_074_715_547_026_259_420_414_817_602_020, 100
        ); // Changed commitment
        vm.roll(block.number + 19_489);
        vm.warp(block.timestamp + 2_368_987);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            4_014_188_762_916_583_598_888_942_667_424_965_430_287_497_824_629_657_219_807_941_460_227_372_577_779, 100
        );
        vm.roll(block.number + 50_607);
        vm.warp(block.timestamp + 6_275_598);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            25_686_798_737_320_918_646_636_587_445_932_741_319_837_891_759_549_806_387_798_392_338_795_533_488_010
        );
        vm.roll(block.number + 32_528);
        vm.warp(block.timestamp + 11_364_405);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            10_214_781_770_912_242_833_804_544_458_045_074_578_052_133_279_441_312_139_903_402_222_217_539_981_379, 100
        ); // Changed commitment
        vm.roll(block.number + 34_897);
        vm.warp(block.timestamp + 7_243_908);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(
            14_593_453_114_436_356_872_569_019_099_482_380_600_010_961_031_449_147_888_385_564_231_161_572_479_533,
            false
        );
        vm.roll(block.number + 32_012);
        vm.warp(block.timestamp + 4_454_946);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(
            25_925_918_697_093_082_051_988_700_719_536_417_857_215_502_310_699_420_143_298_508_813_462_032_862_395
        );
        vm.roll(block.number + 28_697);
        vm.warp(block.timestamp + 15_970_432);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            20_926_361_652_116_949_211_917_910_507_769_891_523_515_114_854_237_984_902_573_398_155_005_471_856_390, 100
        ); // Changed commitment
        vm.roll(block.number + 14_898);
        vm.warp(block.timestamp + 4_838_522);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_932,
            false
        );
        vm.roll(block.number + 19_847);
        vm.warp(block.timestamp + 14_942_829);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptErasureRace(
            70_301_009_613_960_490_917_949_744_526_391_086_498_442_689_163_222_427_992_725_693_722_994_258_137_973,
            false
        );
        vm.roll(block.number + 12_155);
        vm.warp(block.timestamp + 14_219_479);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(
            76_966_217_218_353_830_958_442_135_212_923_621_112_975_360_884_156_253_028_656_115_159_618_856_313_417
        );
        vm.roll(block.number + 9758);
        vm.warp(block.timestamp + 287_808);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_933,
            true
        );
        vm.roll(block.number + 34_448);
        vm.warp(block.timestamp + 7_211_969);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_912,
            false
        );
        vm.roll(block.number + 16_001);
        vm.warp(block.timestamp + 18_874_761);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_931,
            true
        );
        vm.roll(block.number + 37_485);
        vm.warp(block.timestamp + 11_975_371);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptExtensionRace(
            37_335_511_784_273_848_537_689_431_468_682_439_708_817_559_909_961_396_759_913_669_152_336_630_041_800
        );
        vm.roll(block.number + 52_321);
        vm.warp(block.timestamp + 18_466_804);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptErasureRace(477, false);
        vm.roll(block.number + 31_665);
        vm.warp(block.timestamp + 373_007);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            16_879_454_825_081_464_587_162_311_862_201_197_592_918_867_697_827_323_024_893_827_533_308_814_744_699, 100
        ); // Changed commitment
        vm.roll(block.number + 45_111);
        vm.warp(block.timestamp + 15_500_872);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptExtensionRace(
            105_606_550_632_292_314_621_503_518_143_649_535_828_775_273_028_210_522_109_286_717_639_175_153_183_420
        );
        vm.roll(block.number + 36_506);
        vm.warp(block.timestamp + 7_414_210);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(161, 100);
        vm.roll(block.number + 56_897);
        vm.warp(block.timestamp + 12_441_897);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptErasureRace(
            111_398_094_352_181_033_884_768_016_817_884_715_635_237_389_508_840_493_420_231_528_590_208_237_700_862,
            false
        );
        vm.roll(block.number + 8898);
        vm.warp(block.timestamp + 16_471_434);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(
            105_337_060_722_689_913_614_253_553_269_990_692_457_515_092_424_074_600_138_749_804_416_711_343_223_382
        );
        vm.roll(block.number + 5723);
        vm.warp(block.timestamp + 1_922_225);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            18_872_386_506_188_900_128_178_593_638_530_871_606_212_752_948_544_745_205_989_878_007_158_625_800_496
        );
        vm.roll(block.number + 15_232);
        vm.warp(block.timestamp + 6_674_678);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptExtensionRace(4_009_354_985_947_816_657_442_120_275_607);
        vm.roll(block.number + 48_756);
        vm.warp(block.timestamp + 10_087_875);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(69);
        vm.roll(block.number + 38_102);
        vm.warp(block.timestamp + 15_788_002);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            18_840_924_862_590_752_659_304_250_828_416_640_310_422_888_056_457_367_520_753_407_434_927_494_649_451, 100
        );
        vm.roll(block.number + 5750);
        vm.warp(block.timestamp + 2503);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            426_281_677_759_936_592_021_316_809_065_178_817_848_084_678_679_510_574_715_894_138_690_250_139_747, false
        );
        vm.roll(block.number + 21_989);
        vm.warp(block.timestamp + 4_979_832);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            21_853_424_399_738_097_885_762_888_601_689_700_621_597_911_601_971_608_617_330_124_755_808_946_442_755, true
        );
        vm.roll(block.number + 50_175);
        vm.warp(block.timestamp + 2_618_050);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(880, 100);
        vm.roll(block.number + 44_581);
        vm.warp(block.timestamp + 18_429_750);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            6_350_874_878_119_819_312_338_956_282_401_532_410_528_162_663_560_392_320_966_563_075_034_087_161_849, 100
        ); // Changed commitment
        vm.roll(block.number + 25_967);
        vm.warp(block.timestamp + 2_753_174);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(451);
        vm.roll(block.number + 9057);
        vm.warp(block.timestamp + 11_364_502);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            115_792_089_237_316_195_423_570_985_008_687_907_853_269_984_665_640_564_039_457_584_007_913_129_639_934,
            false
        );
        vm.roll(block.number + 11_905);
        vm.warp(block.timestamp + 11_497_582);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(20);
        vm.roll(block.number + 51_936);
        vm.warp(block.timestamp + 11_362_064);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(4_369_999, true);
        vm.roll(block.number + 16_748);
        vm.warp(block.timestamp + 4_392_799);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            11_715_857_356_293_458_169_128_266_324_582_842_123_295_933_765_556_118_813_133_626_045_122_493_941_020, 100
        );
        vm.roll(block.number + 34_563);
        vm.warp(block.timestamp + 2_767_272);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.attemptErasureRace(
            113_494_438_387_109_549_875_854_423_138_737_438_623_578_968_565_768_162_582_136_905_694_666_899_965_063,
            true
        );
        vm.roll(block.number + 28_021);
        vm.warp(block.timestamp + 24);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.attemptExtensionRace(
            115_369_114_333_842_325_499_285_690_322_288_660_192_694_143_071_536_272_487_538_626_891_694_190_637_069
        );
        vm.roll(block.number + 21_122);
        vm.warp(block.timestamp + 6_432_758);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.attemptErasureRace(
            95_725_103_252_022_623_036_343_603_958_987_075_634_200_691_826_026_456_898_605_964_745_085_393_962_918,
            false
        );
        vm.roll(block.number + 4898);
        vm.warp(block.timestamp + 6_842_375);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.attemptExtensionRace(
            24_440_054_405_305_269_366_569_402_256_811_496_959_409_073_762_505_157_381_672_968_839_269_610_695_612
        );
    }
}
