# frozen_string_literal: true

module Engine
  module Game
    module G1836
      module Map
        LAYOUT = :pointy

        LOCATION_NAMES = {
          'B18' => 'Bad Karlshafen',
          'C19' => 'Kgr. Hannover',
          'C11' => 'Ostwestfalen',
          'C15' => 'Arolsen',
          'C17' => 'Hofgeismar',
          'D14' => 'Korbach',
          'D18' => 'Kassel',
          'E15' => 'Bad Wildungen',
          'E17' => 'Fritzlar',
          'E21' => 'Eschwege',
          'F10' => 'Südwestfalen',
          'F14' => 'Frankenberg',
          'F18' => 'Bad Hersfeld',
          'F17' => 'Cleveland',
          'G9' => 'Dillenburg',
          'G11' => 'Biedenkopf',
          'G13' => 'Marburg',
          'G17' => 'Alsfeld',
          'G23' => 'Thüringen',
          'H4' => 'Montabaur',
          'H10' => 'Wetzlar',
          'H12' => 'Gießen',
          'H14' => 'Grünberg',
          'H18' => 'Lauterbach',
          'H20' => 'Fulda',
          'I1' => 'Rheinland',
          'I5' => 'Bad Ems',
          'I7' => 'Limburg',
          'I9' => 'Weilburg',
          'I13' => 'Bad Nauheim',
          'J8' => 'Idstein',
          'J10' => 'Bad Homburg',
          'J12' => 'Friedber',
          'J16' => 'Gellnhausen',
          'K5' => 'Rüdesheim',
          'K9' => 'Wiesbaden',
          'K11' => 'Frankfurt/Main West',
          'K13' => 'Frankfurt/Main Ost',
          'K15' => 'Hanau',
          'L4' => 'Bingen',
          'L8' => 'Mainz',
          'L10' => 'Rüsselsheim',
          'L14' => 'Offenbach',
          'L16' => 'Franken',
          'M9' => 'Groß-Gerau',
          'M11' => 'Darmstadt',
          'N6' => 'Alzey',
          'O9' => 'Worms',
          'O11' => 'Bensheim',
          'O13' => 'Michelstadt',
          'P6' => 'Pfalz',
          'P10' => 'Baden',
          'P12' => 'Neckarsteinach',
        }.freeze

        HEXES = {
          white: {
            %w[F16 M5 M13 O7] => '',
            %w[I13 N6] => 'town=revenue:0',
            %w[D20 G19 I3] => 'upgrade=cost:20,terrain:water',
            %w[D12 E19 F20 G5 G7 G21 H6 J4 J6 N12] => 'upgrade=cost:40,terrain:mountain',
            %w[B18 I5] => 'town=revenue:0;upgrade=cost:20,terrain:water',
            %w[H4 O13 P12] => 'town=revenue:0;upgrade=cost:40,terrain:mountain',
            %w[D18 F18 I7] => 'city=revenue:0;upgrade=cost:20,terrain:water',
            ['C15'] => 'border=edge:4,type:province;border=edge:5,type:province',
            ['C17'] => 'town=revenue:0;border=edge:1,type:province',
            ['D14'] => 'city=revenue:0;border=edge:4,type:province',
            ['D16'] => 'city=revenue:0;border=edge:0,type:province;border=edge:1,type:province;border=edge:2,type:province',
            ['E13'] => 'upgrade=cost:20,terrain:water;border=edge:0,type:province;border=edge:4,type:impassable;' \
                       'border=edge:5,type:province;',
            ['E15'] => 'town=revenue:0;upgrade=cost:60,terrain:water|mountain;border=edge:0,type:province;' \
                       'border=edge:0,type:impassable;border=edge:1,type:impassable;border=edge:3,type:province;' \
                       'border=edge:4,type:province;border=edge:5,type:province;',
            ['E17'] => 'town=revenue:0;upgrade=cost:20,terrain:water;border=edge:1,type:province',
            ['E21'] => 'city=revenue:0;upgrade=cost:40,terrain:mountain',
            ['F12'] => 'upgrade=cost:20,terrain:water;border=edge:3,type:province;border=edge:4,type:province;' \
                       'border=edge:5,type:province',
            ['F14'] => 'city=revenue:0;upgrade=cost:20,terrain:water;border=edge:1,type:province;border=edge:2,type:province;' \
                       'border=edge:3,type:province;border=edge:3,type:impassable',
            ['G9'] => 'town=revenue:0;upgrade=cost:20,terrain:water;border=edge:4,type:province;border=edge:5,type:province;',
            ['G11'] => 'town=revenue:0;upgrade=cost:60,terrain:water|mountain;border=edge:0,type:province;' \
                       'border=edge:1,type:province;border=edge:4,type:province',
            ['G13'] => 'city=revenue:0;upgrade=cost:20,terrain:water;border=edge:0,type:province;border=edge:1,type:province;' \
                       'border=edge:2,type:province;border=edge:5,type:province',
            ['G15'] => 'border=edge:0,type:province;border=edge:4,type:province;border=edge:5,type:province;',
            ['G17'] => 'city=revenue:10;path=a:5,b:_0;border=edge:1,type:province;border=edge:2,type:province;' \
                       'border=edge:3,type:province;border=edge:4,type:province',
            ['H8'] => 'upgrade=cost:40,terrain:mountain;border=edge:4,type:province',
            ['H12'] => 'city=revenue:0;upgrade=cost:20,terrain:water;border=edge:1,type:province;border=edge:3,type:province',
            ['H14'] => 'town=revenue:0;border=edge:2,type:province;border=edge:3,type:province',
            ['H16'] => 'upgrade=cost:40,terrain:mountain;border=edge:2,type:province',
            ['H18'] => 'town=revenue:0;upgrade=cost:40,terrain:mountain;border=edge:3,type:province;' \
                       'border=edge:4,type:province;border=edge:5,type:province',
            ['H20'] => 'city=revenue:0;upgrade=cost:20,terrain:water;border=edge:1,type:province',
            ['I9'] => 'town=revenue:0;upgrade=cost:20,terrain:water;border=edge:3,type:province;border=edge:4,type:province;' \
                      'border=edge:5,type:province',
            ['I11'] => 'upgrade=cost:40,terrain:mountain;border=edge:0,type:province;border=edge:1,type:province;' \
                       'border=edge:2,type:province',
            ['I15'] => 'border=edge:5,type:province',
            ['I17'] => 'border=edge:0,type:province;border=edge:5,type:province',
            ['I19'] => 'border=edge:1,type:province;border=edge:2,type:province',
            ['J8'] => 'town=revenue:0;upgrade=cost:40,terrain:mountain;border=edge:4,type:province',
            ['J12'] => 'town=revenue:0;border=edge:0,type:province;border=edge:5,type:province',
            ['J14'] => 'border=edge:0,type:province;border=edge:4,type:province;border=edge:5,type:province',
            ['J16'] => 'town=revenue:0;border=edge:1,type:province;border=edge:2,type:province;border=edge:3,type:province',
            ['J18'] => 'border=edge:2,type:province',
            ['K5'] => 'city=revenue:0;border=edge:0,type:province;border=edge:0,type:water,cost:60;border=edge:5,type:impassable',
            ['K7'] => 'border=edge:0,type:impassable;border=edge:5,type:impassable',
            ['K9'] => 'city=revenue:0;border=edge:0,type:water,cost:60;border=edge:5,type:water,cost:60;' \
                      'border=edge:0,type:province;border=edge:3,type:province;border=edge:4,type:province;' \
                      'border=edge:5,type:province',
            ['K11'] => 'city=revenue:0;path=a:4,b:_0,track:narrow;border=edge:0,type:province;border=edge:1,type:province;' \
                       'border=edge:2,type:province;border=edge:3,type:province;border=edge:5,type:province',
            ['K13'] => 'city=revenue:0;path=a:1,b:_0,track:narrow;border=edge:0,type:province;border=edge:2,type:province;' \
                       'border=edge:3,type:province;border=edge:4,type:province;border=edge:5,type:province',
            ['K15'] => 'city=revenue:0;upgrade=cost:20,terrain:water;border=edge:0,type:province;border=edge:1,type:province;' \
                       'border=edge:2,type:province',
            ['L4'] => 'city=revenue:0;upgrade=cost:20,terrain:water;border=edge:3,type:province;border=edge:3,type:water,cost:60',
            ['L6'] => 'border=edge:2,type:impassable;border=edge:3,type:impassable',
            ['L8'] => 'city=revenue:10;path=a:1,b:_0;border=edge:3,type:province;border=edge:3,type:water,cost:60;' \
                      'border=edge:4,type:water,cost:60;border=edge:5,type:water,cost:60;border=edge:2,type:impassable',
            ['L10'] => 'town=revenue:0;border=edge:1,type:water,cost:60;border=edge:2,type:province;' \
                       'border=edge:2,type:water,cost:60;border=edge:3,type:province',
            ['L12'] => 'border=edge:2,type:province;border=edge:3,type:province',
            ['L14'] => 'city=revenue:0;border=edge:2,type:province;border=edge:3,type:province',
            ['M7'] => 'border=edge:4,type:impassable',
            ['M9'] => 'town=revenue:0;border=edge:0,type:impassable;border=edge:1,type:impassable;' \
                      'border=edge:2,type:water,cost:60',
            ['M11'] => 'city=revenue:0',
            ['N8'] => 'border=edge:3,type:impassable;border=edge:4,type:impassable',
            ['N10'] => 'border=edge:0,type:impassable;border=edge:1,type:impassable',
            ['O9'] => 'city=revenue:0;border=edge:3,type:impassable;border=edge:4,type:water,cost:60',
            ['O11'] => 'city=revenue:0;border=edge:1,type:water,cost:60',
          },
          red: {
            ['C11'] => 'offboard=revenue:yellow_30|green_40|brown_50;path=a:5,b:_0',
            ['C19'] => 'offboard=revenue:yellow_30|green_40|brown_50;path=a:0,b:_0;path=a:2,b:_0;',
            ['F10'] => 'offboard=revenue:yellow_20|green_30|brown_40;path=a:0,b:_0;path=a:5,b:_0;',
            ['L16'] => 'offboard=revenue:yellow_20|green_30|brown_50;path=a:1,b:_0;path=a:2,b:_0',
            ['O5'] => 'offboard=revenue:yellow_20|green_30|brown_50,groups:Pfalz,hide:1;path=a:3,b:_0;border=edge:5',
            ['P6'] => 'offboard=revenue:yellow_20|green_30|brown_50,groups:Pfalz;border=edge:2;border=edge:4',
            ['P8'] => 'offboard=revenue:yellow_20|green_30|brown_50,groups:Pfalz,hide:1;path=a:2,b:_0;path=a:3,b:_0;' \
                      'border=edge:1',
            ['F22'] => 'offboard=revenue:yellow_30|green_40|brown_50,groups:Thüringen,hide:1;path=a:2,b:_0;border=edge:5',
            ['G23'] => 'offboard=revenue:yellow_30|green_40|brown_50,groups:Thüringen;path=a:1,b:_0;border=edge:0;border=edge:2',
            ['H22'] => 'offboard=revenue:yellow_30|green_40|brown_50,groups:Thüringen,hide:1;path=a:1,b:_0;border=edge:3',
            ['P10'] => 'offboard=revenue:yellow_30|green_40|brown_50;path=a:3,b:_0;path=a:4,b:_0',
            ['H2'] => 'offboard=revenue:yellow_30|green_50|brown_60,groups:Rheinland,hide:1;path=a:4,b:_0;' \
                      'path=a:5,b:_0;border=edge:0',
            ['I1'] => 'offboard=revenue:yellow_30|green_50|brown_60,groups:Rheinland;border=edge:3;border=edge:5',
            ['J2'] => 'offboard=revenue:0,groups:Rheinland,hide:1;border=edge:2;border=edge:5',
            ['K3'] => 'offboard=revenue:yellow_30|green_50|brown_60,groups:Rheinland,hide:1;path=a:5,b:_0;border=edge:2',
          },
          green: {
            ['J10'] => 'town=revenue:0;upgrade=cost:40,terrain:mountain;' \
                       'border=edge:0,type:province;border=edge:1,type:province;border=edge:2,type:province;' \
                       'border=edge:3,type:province;border=edge:4,type:province;border=edge:5,type:province',
          },
          brown: {
            ['H10'] => 'city=revenue:yellow_20|green_30|brown_40;path=a:2,b:_0;path=a:4,b:_0;path=a:6,b:_0;' \
                       'border=edge:0,type:province;border=edge:1,type:province;border=edge:2,type:province;' \
                       'border=edge:3,type:province;border=edge:4,type:province;border=edge:5,type:province',
          },
        }.freeze

        TILES = {
          '3' => 4,
          '4' => 6,
          '5' => 4,
          '6' => 6,
          '7' => 4,
          '8' => 14,
          '9' => 10,
          '16' => 1,
          '19' => 1,
          '20' => 1,
          '23' => 3,
          '24' => 3,
          '25' => 3,
          '26' => 1,
          '27' => 1,
          '28' => 1,
          '29' => 1,
          '30' => 1,
          '31' => 1,
          '39' => 1,
          '40' => 1,
          '41' => 1,
          '42' => 1,
          '43' => 1,
          '44' => 1,
          '45' => 2,
          '46' => 2,
          '47' => 2,
          '57' => 5,
          '58' => 8,
          '70' => 1,
          '141' => 3,
          '142' => 3,
          '143' => 3,
          '144' => 3,
          '441' => 3,
          '442' => 3,
          '443' => 3,
          '444' => 3,
          '448' => 3,
          '449' => 2,
          '450' => 3,
          '767' => 3,
          '768' => 4,
          '769' => 3,
          '920' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;label=MZ;path=a:0,b:_0;path=a:1,b:_0',
          },
          '921' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;city=revenue:30;city=revenue:30;label=F/W;path=a:1,b:_0;path=a:3,b:_1;path=a:5,b:_2;' \
                      'path=a:4,b:_0,track:narrow;path=a:4,b:_1,track:narrow;path=a:4,b:_2,track:narrow',
          },
          '922' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;label=F/O;path=a:1,b:_0,track:narrow;path=a:4,b:_0',
          },
          '923' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:50;label=F/W;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0,track:narrow;path=a:5,b:_0',
          },
          '924' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:50;label=F/O;path=a:1,b:_0,track:narrow;path=a:4,b:_0;path=a:5,b:_0',
          },
          '925' =>
          {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:60;label=F/W;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;' \
                      'path=a:4,b:_0,track:narrow;path=a:5,b:_0',
          },
          '926' =>
          {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:60;label=F/O;path=a:0,b:_0;path=a:1,b:_0,track:narrow;path=a:3,b:_0;path=a:4,b:_0;' \
                      'path=a:5,b:_0',
          },
          '927' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;label=KGD;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          '928' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;label=KGD;path=a:0,b:_0;path=a:3,b:_0;path=a:5,b:_0',
          },
          '929' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;label=KGD;path=a:0,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          },
          '930' =>
          {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;label=KGD;path=a:0,b:_0;path=a:2,b:_0;path=a:4,b:_0',
          },
          '931' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,slots:2;label=KGD;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0',
          },
          '932' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,slots:2;label=KGD;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:5,b:_0',
          },
          '933' =>
          {
            'count' => 2,
            'color' => 'green',
            'code' => 'city=revenue:40,slots:2;label=KGD;path=a:0,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0',
          },
          '934' =>
          {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:40,slots:2;label=MZ;path=a:0,b:_0;path=a:1,b:_0',
          },
          '935' =>
          {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:50,slots:3;label=MZ;path=a:0,b:_0;path=a:1,b:_0',
          },
          '936' =>
          {
            'count' => 3,
            'color' => 'brown',
            'code' => 'city=revenue:50,slots:3;label=KGD;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;' \
                      'path=a:5,b:_0',
          },
          '939' =>
          {
            'count' => 1,
            'color' => 'brown',
            'code' => 'town=revenue:10;label=Hom;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:4,b:_0;path=a:5,b:_0',
          },
        }.freeze
      end
    end
  end
end
