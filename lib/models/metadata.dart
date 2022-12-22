import 'package:fut_chemistry/constants/player_render_position.dart';
import 'package:fut_chemistry/models/player.dart';

import 'club.dart';
import 'formation.dart';
import 'league.dart';
import 'manager.dart';
import 'nation.dart';

class Metadata {
  Metadata(
      {required this.leagues,
      required this.clubs,
      required this.nations,
      required this.players,
      required this.managers});

  List<Nation> nations = [];
  List<League> leagues = [];
  List<Club> clubs = [];
  List<Player> players = [];
  List<Manager> managers = [];
  List<Formation> formations = [
    Formation(id: 1, name: "3-4-3", positions: [
      "LW",
      "ST",
      "RW",
      "LM",
      "CM",
      "CM",
      "RM",
      "CB",
      "CB",
      "CB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 2, name: "3-5-2", positions: [
      "ST",
      "ST",
      "CAM",
      "LM",
      "CM",
      "CM",
      "RM",
      "CB",
      "CB",
      "CB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 3, name: "4-2-4", positions: [
      "ST",
      "ST",
      "LW",
      "RW",
      "CM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Nice
    Formation(id: 4, name: "4-3-3", positions: [
      "LW",
      "ST",
      "RW",
      "CM",
      "CM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Nice
    Formation(id: 5, name: "4-4-2", positions: [
      "ST",
      "ST",
      "LM",
      "CM",
      "CM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Ok
    Formation(id: 6, name: "4-5-1", positions: [
      "ST",
      "LM",
      "CAM",
      "CM",
      "CAM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),

    Formation(id: 8, name: "5-4-1", positions: [
      "ST",
      "LM",
      "CM",
      "CM",
      "RM",
      "LWB",
      "CB",
      "CB",
      "CB",
      "RWB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lwb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rwb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 9, name: "3-1-4-2", positions: [
      "ST",
      "ST",
      "LM",
      "CM",
      "CDM",
      "CM",
      "RM",
      "CB",
      "CB",
      "CB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 10, name: "3-4-1-2", positions: [
      "ST",
      "CAM",
      "ST",
      "LM",
      "CM",
      "CM",
      "RM",
      "CB",
      "CB",
      "CB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 11, name: "3-4-2-1", positions: [
      "CF",
      "ST",
      "CF",
      "LM",
      "CM",
      "CM",
      "RM",
      "CB",
      "CB",
      "CB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.camLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 12, name: "4-1-3-2", positions: [
      "ST",
      "ST",
      "CM",
      "LM",
      "CDM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 13, name: "4-1-4-1", positions: [
      "ST",
      "LM",
      "CM",
      "CM",
      "RM",
      "CDM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Nice
    Formation(id: 14, name: "4-2-2-2", positions: [
      "ST",
      "ST",
      "CAM",
      "CAM",
      "CDM",
      "CDM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 15, name: "4-2-3-1", positions: [
      "ST",
      "CAM",
      "CAM",
      "CAM",
      "CDM",
      "CDM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Nice
    Formation(id: 16, name: "4-3-1-2", positions: [
      "ST",
      "ST",
      "CAM",
      "CM",
      "CM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 17, name: "4-3-2-1", positions: [
      "CF",
      "ST",
      "CF",
      "CM",
      "CM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.camLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 18, name: "4-4-1-1", positions: [
      "ST",
      "CF",
      "LM",
      "CM",
      "CM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 19, name: "5-2-1-2", positions: [
      "ST",
      "CAM",
      "ST",
      "CM",
      "CM",
      "LWB",
      "CB",
      "CB",
      "CB",
      "RWB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lwb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rwb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 20, name: "5-2-2-1", positions: [
      "LW",
      "ST",
      "RW",
      "CM",
      "CM",
      "LWB",
      "CB",
      "CB",
      "CB",
      "RWB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lwb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cbCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rwb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Nice
    Formation(id: 21, name: "4-1-2-1-2", positions: [
      "ST",
      "CAM",
      "ST",
      "LM",
      "CDM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 22, name: "4-1-2-1-2 (2)", positions: [
      "ST",
      "CAM",
      "ST",
      "CM",
      "CDM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 23, name: "4-2-3-1 (2)", positions: [
      "ST",
      "LM",
      "CAM",
      "RM",
      "CDM",
      "CDM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    //Test 1
    Formation(id: 24, name: "4-3-3 (2)", positions: [
      "LW",
      "ST",
      "RW",
      "CM",
      "CDM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 25, name: "4-3-3 (3)", positions: [
      "LW",
      "ST",
      "RW",
      "CDM",
      "CM",
      "CDM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 26, name: "4-3-3 (4)", positions: [
      "LW",
      "ST",
      "RW",
      "CM",
      "CAM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 27, name: "4-3-3 (5)", positions: [
      "LW",
      "CF",
      "RW",
      "CM",
      "CDM",
      "CM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.lw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cfCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rw),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cdm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 28, name: "4-4-2 (2)", positions: [
      "ST",
      "ST",
      "LM",
      "CDM",
      "CDM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.stRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),

    Formation(id: 29, name: "4-5-1 (2)", positions: [
      "ST",
      "LM",
      "CM",
      "CM",
      "CM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCLeft),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.cmCRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camRight),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
    Formation(id: 30, name: "4-4-1-1 (2)", positions: [
      "ST",
      "CAM",
      "LM",
      "CM",
      "CM",
      "RM",
      "LB",
      "CB",
      "CB",
      "RB",
      "GK"
    ], offsets: [
      PlayerRenderPosition.getRenderPosition(RenderPosition.stCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.camCenter),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rm),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.lcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rcb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.rb),
      PlayerRenderPosition.getRenderPosition(RenderPosition.gk)
    ]),
  ];
}
