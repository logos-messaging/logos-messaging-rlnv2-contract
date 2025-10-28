pragma solidity 0.8.24;

// Initial test replay generated from Echidna log at https://getrecon.xyz/tools/echidna
// Assume EchidnaTest.sol is the Echidna harness contract that defines the methods like registerMembership,
// attemptExtensionRace, attemptErasureRace.
import "./EchidnaTest.t.sol";
import "forge-std/Test.sol"; // Replace with the actual path to EchidnaTest.sol

contract EchidnaReplay is Test {
    EchidnaTest internal echidna;

    function setUp() public {
        echidna = new EchidnaTest();
    }

    function test_attemptErasureRace_WakuRLN() public {
        vm.roll(block.number + 11_796);
        vm.warp(block.timestamp + 5_474_623);
        vm.prank(0x0000000000000000000000000000000000020000);
        echidna.registerMembership(
            15_331_181_254_680_049_984_374_210_433_775_713_530_849_624_954_688_899_814_297_733_641_575_188_164_316,
            1_002_356_836
        );
        vm.roll(block.number + 47_085);
        vm.warp(block.timestamp + 9_714_873);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            57_443_432_183_176_588_916_867_111_037_381_903_541_553_297_067_891_717_016_451_751_957_342_384_738_336,
            160_001
        );
        vm.roll(block.number + 38_103);
        vm.warp(block.timestamp + 4_558_906);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            102_920_729_880_426_261_698_536_426_573_884_612_971_230_188_871_291_431_396_182_739_877_428_962_960_239,
            2_847_778_459
        );
        vm.roll(block.number + 29_746);
        vm.warp(block.timestamp + 13_228_720);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            86_642_110_490_369_375_485_379_969_193_766_212_650_854_355_737_426_080_322_527_445_883_017_455_452_642, 4
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
            93_069_777_957_716_534_626_511_592_676_095_128_883_541_549_173_304_417_502_211_440_887_097_265_352_764,
            23_935_070
        );
        vm.roll(block.number + 46_636);
        vm.warp(block.timestamp + 11_821_678);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            51_522_906_060_057_278_679_990_947_101_404_412_153_472_957_736_268_514_263_884_637_927_398_269_578_188,
            1_190_462_738
        );
        vm.roll(block.number + 57_888);
        vm.warp(block.timestamp + 11_470_172);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            61_542_542_599_287_154_647_970_081_191_182_610_995_985_456_890_733_246_815_310_689_354_155_913_446_715,
            425_830_326
        );
        vm.roll(block.number + 53_678);
        vm.warp(block.timestamp + 1_059_409);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            15_151_206_851_768_761_922_626_779_419_716_885_032_550_609_243_972_739_304_354_508_404_025_123_978_483,
            1_532_892_061
        );
        vm.roll(block.number + 9163);
        vm.warp(block.timestamp + 5_088_962);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            14_081_762_237_856_300_239_452_543_304_351_251_708_585_712_948_734_528_663_957_353_575_674_639_038_360,
            1_578_212_921
        );
        vm.roll(block.number + 57_370);
        vm.warp(block.timestamp + 7_211_971);
        vm.prank(0x0000000000000000000000000000000000010000);
        echidna.registerMembership(
            108_963_296_912_626_303_058_593_673_031_410_359_103_080_213_800_576_845_606_511_577_526_451_809_781_764, 597
        );
        vm.roll(block.number + 52_325);
        vm.warp(block.timestamp + 7_269_956);
        vm.prank(0x0000000000000000000000000000000000040000);
        echidna.registerMembership(
            59_854_361_444_067_331_214_800_449_562_275_531_518_062_284_755_304_292_849_816_766_824_186_269_102_025,
            359_384_427
        );
        vm.roll(block.number + 13);
        vm.warp(block.timestamp + 11_809_403);
        vm.prank(0x0000000000000000000000000000000000030000);
        echidna.registerMembership(
            30_515_202_238_888_354_901_379_804_575_700_505_769_761_565_567_680_891_590_302_236_564_961_093_984_633,
            15_551_999
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
        vm.roll(block.number + 59109);
        vm.warp(block.timestamp + 12682314);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptErasureRace(115710044366489380560145754182836127776606905958965281515627230965944185828197, true);
        vm.roll(block.number + 35655);
        vm.warp(block.timestamp + 15576565);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(12439145154143552525910919713868996066330922688700283373718845930110014852748, 100);
        vm.roll(block.number + 5763);
        vm.warp(block.timestamp + 6585509);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(17390757134860691103601339956017953267743470484370144179061550943820859938352, false);
        vm.roll(block.number + 24311);
        vm.warp(block.timestamp + 12762680);
        vm.prank(0x0000000000000000000000000000000000040000);
        registerMembership(30550828421328047254873089071721340, 100);
        vm.roll(block.number + 12819);
        vm.warp(block.timestamp + 1649692);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(104850126800538479521627521813512576589921885869622125078501950362797396775732);
        vm.roll(block.number + 45108);
        vm.warp(block.timestamp + 1956666);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(34886597912158088398731931734494950295345955711258232465783822303829418980034, 100);
        vm.roll(block.number + 53007);
        vm.warp(block.timestamp + 276592);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(834);
        vm.roll(block.number + 25848);
        vm.warp(block.timestamp + 11362065);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(39174465178587396508459477969368571131696829920441112535821186895419294115835, 100);
        vm.roll(block.number + 33171);
        vm.warp(block.timestamp + 383675);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(7022159125197495734384997711896547675021391130223237843255817587255104160363);
        vm.roll(block.number + 15676);
        vm.warp(block.timestamp + 11735351);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptExtensionRace(101185480181713116242457669701483883593620024991591651269453671853652437478102);
        vm.roll(block.number + 44384);
        vm.warp(block.timestamp + 18346179);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(4908416131442887573991189028182614782884545304889259793974797565686968097292, 100);
        vm.roll(block.number + 16801);
        vm.warp(block.timestamp + 573740);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(115792089237316195423570985008687907853269984665640564039457584007913129639933, 100);
        vm.roll(block.number + 35654);
        vm.warp(block.timestamp + 4068035);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptExtensionRace(18978082967849498068717608127246258727629855559346799025101476822814831852169);
        vm.roll(block.number + 30101);
        vm.warp(block.timestamp + 4745968);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptExtensionRace(6106105733994696914590284712692);
        vm.roll(block.number + 6700);
        vm.warp(block.timestamp + 14763861);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptExtensionRace(104237522040539086529385814200395911913667236478153241258910237150016100933281);
        vm.roll(block.number + 52780);
        vm.warp(block.timestamp + 16427024);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(8555773188090352132903209190922658630799967488207010664039959647283030053950, 100);
        vm.roll(block.number + 36392);
        vm.warp(block.timestamp + 11470167);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptErasureRace(9394776414966240069580838672673694685292165040808226440647796406499139370962, true);
        vm.roll(block.number + 13355);
        vm.warp(block.timestamp + 16427025);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptErasureRace(9630707582521938235113899367442877106957117302212260601089037887382200262601, false);
        vm.roll(block.number + 22867);
        vm.warp(block.timestamp + 159999);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(28243736643972833793366231626843204992644487197555289924254482104591589940922);
        vm.roll(block.number + 22820);
        vm.warp(block.timestamp + 4779059);
        vm.prank(0x0000000000000000000000000000000000040000);
        registerMembership(19201590924623513311141753466125212569043677014481753075022686585593991810749, 100);
        vm.roll(block.number + 35266);
        vm.warp(block.timestamp + 3182076);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptExtensionRace(43827548018134037042906582304483527074537881763084930140765111011615661349666);
        vm.roll(block.number + 19490);
        vm.warp(block.timestamp + 299200);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(12776298811140222029408960445729157525018582422120161448937390282915768616624);
        vm.roll(block.number + 51788);
        vm.warp(block.timestamp + 18651487);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptErasureRace(107301127263897597227628761122806603306606929334009477725205515511615612118148, true);
        vm.roll(block.number + 49348);
        vm.warp(block.timestamp + 12337026);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(14744269619966411208579211824598458697587494354926760081771325075741142829158, 100);
        vm.roll(block.number + 49829);
        vm.warp(block.timestamp + 12713084);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(43792367251478649051155053078982380795888842184379994324460592762045082390946);
        vm.roll(block.number + 7659);
        vm.warp(block.timestamp + 14763856);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(828, true);
        vm.roll(block.number + 36651);
        vm.warp(block.timestamp + 4476578);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(115046885519045122606446282744980637739795881293862923481580204068197516138270, false);
        vm.roll(block.number + 41972);
        vm.warp(block.timestamp + 15765194);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptErasureRace(7171889270225471948987523104033632910444398328090760036609063776968837717794, true);
        vm.roll(block.number + 12338);
        vm.warp(block.timestamp + 16542398);
        vm.prank(0x0000000000000000000000000000000000040000);
        registerMembership(36820031792293339223546668816467201710704202917197104615399587045614220405399, 100);
        vm.roll(block.number + 21241);
        vm.warp(block.timestamp + 1018641);
        vm.prank(0x0000000000000000000000000000000000010000);
        registerMembership(77752533705984083621774514325091611770137972395322818578120871980142243088871, 100); // Updated to 100 for consistency
        vm.roll(block.number + 19489);
        vm.warp(block.timestamp + 2368987);
        vm.prank(0x0000000000000000000000000000000000030000);
        registerMembership(4014188762916583598888942667424965430287497824629657219807941460227372577779, 100); // Updated
        vm.roll(block.number + 50607);
        vm.warp(block.timestamp + 6275598);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptExtensionRace(25686798737320918646636587445932741319837891759549806387798392338795533488010);
        vm.roll(block.number + 32528);
        vm.warp(block.timestamp + 11364405);
        vm.prank(0x0000000000000000000000000000000000040000);
        registerMembership(53991267514590793278297355948559624755148862080273380827299810595369156972613, 100);
        vm.roll(block.number + 34897);
        vm.warp(block.timestamp + 7243908);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptErasureRace(14593453114436356872569019099482380600010961031449147888385564231161572479533, false);
        vm.roll(block.number + 32012);
        vm.warp(block.timestamp + 4454946);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(25925918697093082051988700719536417857215502310699420143298508813462032862395);
        vm.roll(block.number + 28697);
        vm.warp(block.timestamp + 15970432);
        vm.prank(0x0000000000000000000000000000000000040000);
        registerMembership(108479333139474050100903533488798991877708572455902122277366214901308705838858, 100);
        vm.roll(block.number + 14898);
        vm.warp(block.timestamp + 4838522);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptErasureRace(115792089237316195423570985008687907853269984665640564039457584007913129639932, false);
        vm.roll(block.number + 19847);
        vm.warp(block.timestamp + 14942829);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptErasureRace(70301009613960490917949744526391086498442689163222427992725693722994258137973, false);
        vm.roll(block.number + 12155);
        vm.warp(block.timestamp + 14219479);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(76966217218353830958442135212923621112975360884156253028656115159618856313417);
        vm.roll(block.number + 9758);
        vm.warp(block.timestamp + 287808);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptErasureRace(115792089237316195423570985008687907853269984665640564039457584007913129639933, true);
        vm.roll(block.number + 34448);
        vm.warp(block.timestamp + 7211969);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(115792089237316195423570985008687907853269984665640564039457584007913129639912, false);
        vm.roll(block.number + 16001);
        vm.warp(block.timestamp + 18874761);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(115792089237316195423570985008687907853269984665640564039457584007913129639931, true);
        vm.roll(block.number + 37485);
        vm.warp(block.timestamp + 11975371);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptExtensionRace(37335511784273848537689431468682439708817559909961396759913669152336630041800);
        vm.roll(block.number + 52321);
        vm.warp(block.timestamp + 18466804);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptErasureRace(477, false);
        vm.roll(block.number + 31665);
        vm.warp(block.timestamp + 373007);
        vm.prank(0x0000000000000000000000000000000000030000);
        registerMembership(82544183440599290253901529097973022858563960899075426055988440093036240231550, 100);
        vm.roll(block.number + 45111);
        vm.warp(block.timestamp + 15500872);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptExtensionRace(105606550632292314621503518143649535828775273028210522109286717639175153183420);
        vm.roll(block.number + 36506);
        vm.warp(block.timestamp + 7414210);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(161, 100);
        vm.roll(block.number + 56897);
        vm.warp(block.timestamp + 12441897);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptErasureRace(111398094352181033884768016817884715635237389508840493420231528590208237700862, false);
        vm.roll(block.number + 8898);
        vm.warp(block.timestamp + 16471434);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(105337060722689913614253553269990692457515092424074600138749804416711343223382);
        vm.roll(block.number + 5723);
        vm.warp(block.timestamp + 1922225);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptExtensionRace(18872386506188900128178593638530871606212752948544745205989878007158625800496);
        vm.roll(block.number + 15232);
        vm.warp(block.timestamp + 6674678);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptExtensionRace(4009354985947816657442120275607);
        vm.roll(block.number + 48756);
        vm.warp(block.timestamp + 10087875);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(69);
        vm.roll(block.number + 38102);
        vm.warp(block.timestamp + 15788002);
        vm.prank(0x0000000000000000000000000000000000020000);
        registerMembership(18840924862590752659304250828416640310422888056457367520753407434927494649451, 100);
        vm.roll(block.number + 5750);
        vm.warp(block.timestamp + 2503);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(426281677759936592021316809065178817848084678679510574715894138690250139747, false);
        vm.roll(block.number + 21989);
        vm.warp(block.timestamp + 4979832);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptErasureRace(21853424399738097885762888601689700621597911601971608617330124755808946442755, true);
        vm.roll(block.number + 50175);
        vm.warp(block.timestamp + 2618050);
        vm.prank(0x0000000000000000000000000000000000010000);
        registerMembership(880, 100);
        vm.roll(block.number + 44581);
        vm.warp(block.timestamp + 18429750);
        vm.prank(0x0000000000000000000000000000000000040000);
        registerMembership(115792089237316195423570985008687907853269984665640564039457584007913129639934, 100);
        vm.roll(block.number + 25967);
        vm.warp(block.timestamp + 2753174);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(451);
        vm.roll(block.number + 9057);
        vm.warp(block.timestamp + 11364502);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(115792089237316195423570985008687907853269984665640564039457584007913129639934, false);
        vm.roll(block.number + 11905);
        vm.warp(block.timestamp + 11497582);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(20);
        vm.roll(block.number + 51936);
        vm.warp(block.timestamp + 11362064);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(4369999, true);
        vm.roll(block.number + 16748);
        vm.warp(block.timestamp + 4392799);
        vm.prank(0x0000000000000000000000000000000000030000);
        registerMembership(11715857356293458169128266324582842123295933765556118813133626045122493941020, 100);
        vm.roll(block.number + 34563);
        vm.warp(block.timestamp + 2767272);
        vm.prank(0x0000000000000000000000000000000000040000);
        attemptErasureRace(113494438387109549875854423138737438623578968565768162582136905694666899965063, true);
        vm.roll(block.number + 28021);
        vm.warp(block.timestamp + 24);
        vm.prank(0x0000000000000000000000000000000000010000);
        attemptExtensionRace(115369114333842325499285690322288660192694143071536272487538626891694190637069);
        vm.roll(block.number + 21122);
        vm.warp(block.timestamp + 6432758);
        vm.prank(0x0000000000000000000000000000000000030000);
        attemptErasureRace(95725103252022623036343603958987075634200691826026456898605964745085393962918, false);
        vm.roll(block.number + 4898);
        vm.warp(block.timestamp + 6842375);
        vm.prank(0x0000000000000000000000000000000000020000);
        attemptExtensionRace(24440054405305269366569402256811496959409073762505157381672968839269610695612);
    }
}
