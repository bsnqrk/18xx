# frozen_string_literal: true

module Engine
  module Game
    module G1836
      module Entities
        COMPANIES = [
          {
            sym: 'P1',
            name: 'Homburger Bahn',
            value: 20,
            revenue: 5,
            desc: 'With begin of the brown phase, the owner immediately may lay the brown tile #939 on hex J10 (Bad Homburg) ' \
                  'for free.',
            abilities: [
              {
                type: 'tile_lay',
                hexes: %w[J10],
                tiles: %w[939],
                owner_type: 'corporation',
                on_phase: '5',
                special: true,
                count: 1,
                free: true,
              },
           ],
          },
          {
            sym: 'P2',
            name: 'Baugesellschaft Rheinbrücken',
            value: 40,
            revenue: 10,
            desc: 'Closes at the latest at begin of the brown phase. ' \
                  'A corporation, in which the owner is a director, can build a Rhine bridge (or Main estuary bridge) before ' \
                  'the beginning of the brown phase free of charge and in addition to the normal construction action (before ' \
                  'or after), but a maximum of one per operation round. The bridge must extend the network of the railway ' \
                  'company using it. This company allows up to two builds for free of a Rhine bridge and closes early by ' \
                  'building its second free Rhine bridge.',
            abilities: [
              {
                type: 'tile_lay',
                hexes: %w[J10],
                tiles: %w[939],
                owner_type: 'corporation',
                on_phase: '5',
                special: true,
                count: 1,
                free: true,
              },
              {
                type: 'tile_lay',
                hexes: %w[J10],
                tiles: %w[939],
                owner_type: 'corporation',
                on_phase: '5',
                special: true,
                count: 1,
                free: true,
              },
            ],
          },
          {
            sym: 'P3',
            name: 'Frankfurter Lokalbahnen AG',
            value: 50,
            revenue: 10,
            desc: 'Closes at the start of the brown phase (Frankfurt is built on by the companies from then on). ' \
                  'May build on one of the two Frankfurt spaces per OR (green only with at the start of phase 3). ' \
                  'The owner of the FLB also manages Frankfurt\'s right of passage concession. ' \
                  'As long as the FLB is not closed, each railroad company may acquire such a right of passage once per game ' \
                  'for 40 M, which is paid to the owner of the FLB. Such a company may then use the local railway line until ' \
                  'the end of the game. (Frankurt counts as a single station for this purpose. In case of doubt, the higher ' \
                  'value applies).',
          },
          {
            sym: 'P4',
            name: 'Baugesellschaft Edertalsperre',
            value: 60,
            revenue: 15,
            desc: 'Spezialfertigkeit: kann ab der grünen Phase gegen 10% WLB eingetauscht werden, muss dann kostenlos sofort ' \
                  'als Sonder-Gleisbau das Feld Bad Wildungen gelb bebauen. Sie muss am Ende der OR getauscht werden, in der ' \
                  'Bad Wildungen anderweitig bebaut wird, spätestens jedoch mit Beginn der braunen Phase inklusive des ' \
                  'Sonder-Gleisbaus, was mitten in der OR wäre (wobei dann die Austauschaktie in der laufenden OR noch keine ' \
                  'Dividende durch Ausschütten erhält), selbst wenn zu einem solchen Zeitpunkt die WLB noch nicht gegründet ' \
                  'worden ist. Geht die WLB durch den letzteren Fall in Betrieb, operiert sie erstmals in der folgenden OR. ' \
                  'Der Besitzer der Baugesellschaft Edertalsperre verwaltet auch das Konzessionsrecht für Waldeck.',
          },
          {
            sym: 'P5',
            name: 'Frankfurt-Hanauer-Bahn',
            value: 70,
            revenue: 15,
            desc: 'Spezialfertigkeit: kann ab der grünen Phase gegen 10% FHB eingetauscht werden, dann erhält die FHB einen ' \
                  'kostenlosen zweiten Heimat-Bahnhofsmarker in Hanau (auch wenn Hanau noch unbebaut ist). Dies muss ' \
                  'spätestens mit Beginn der braunen Phase erfolgen, was mitten in der OR wäre (wobei dann die Austauschaktie ' \
                  'in der laufenden OR noch keine Dividende durch Ausschütten erhält), selbst wenn die FHB zu diesem Zeitpunkt ' \
                  'noch nicht gegründet worden ist. Geht die FHB durch den letzteren Fall in Betrieb, operiert sie erstmals in ' \
                  'der folgenden OR. Der Besitzer der Frankfurt-Hanauer-Bahn verwaltet auch das Konzessionsrecht für ' \
                  'Hessen-Kassel.',
          },
          {
            sym: 'P6',
            name: 'Taunusbahn',
            value: 80,
            revenue: 15,
            desc: 'Spezialfertigkeit: kann ab der grünen Phase gegen 10% WEG eingetauscht werden, muss dann kostenlos sofort ' \
                  'ein Taunusfeld in Nassau gelb bebauen. Sie muss am Ende der OR getauscht werden, in der alle drei ' \
                  'Taunusfelder anderweitig bebaut worden sind, spätestens jedoch mit Beginn der braunen Phase inklusive des ' \
                  'Sonder-Gleisbaus, was mitten in der OR wäre (wobei dann die Austauschaktie in der laufenden OR noch keine ' \
                  'Dividende durch Ausschütten erhält), selbst wenn zu einem solchen Zeitpunkt die WEG noch nicht gegründet ' \
                  'worden ist. Geht die WEG durch den letzteren Fall in Betrieb, operiert sie erstmals in der folgenden OR.' \
                  'Der Besitzer der Taunusbahn verwaltet auch das Konzessionsrecht für Nassau.',
          },
          {
            sym: 'P7',
            name: 'Odenwaldbahn',
            value: 90,
            revenue: 15,
            desc: 'Spezialfertigkeit: kann ab der grünen Phase gegen 10% SB eingetauscht werden, muss dann kostenlos sofort ' \
                  'ein Odenwaldfeld gelb bebauen. Sie muss am Ende der OR getauscht werden, in der alle drei Odenwaldfelder ' \
                  'anderweitig bebaut worden sind, spätestens jedoch mit Beginn der braunen Phase inklusive des ' \
                  'Sonder-Gleisbaus, was mitten in der OR wäre (wobei dann die Austauschaktie in der laufenden OR noch keine ' \
                  'Dividende durch Ausschütten erhält), selbst wenn zu einem solchen Zeitpunkt die SB noch nicht gegründet ' \
                  'worden ist. Geht die SB durch den letzteren Fall in Betrieb, operiert sie erstmals in der folgenden OR. ' \
                  'Der Besitzer der Odenwaldbahn verwaltet auch das Konzessionsrecht für Hessen-Darmstadt.',
          },
        ].freeze

        CORPORATIONS = [
          {
            float_percent: 50,
            sym: 'WEG',
            name: 'Wiesbadener Eisenbahn-Gesellschaft',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'J9',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'LTB',
            name: 'Lahntalbahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'H7',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'MNB',
            name: 'Main-Neckar-Bahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'N11',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'SB',
            name: 'Starkenburger Bahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'L11',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'HLB',
            name: 'Hessische Ludwigseisenbahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'K8',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'VB',
            name: 'Vogelsbergbahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'F17',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'MWB',
            name: 'Main-Weser-Bahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'F13',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'FWN',
            name: 'Friedrich-Wilhelm-Nordbahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'C18',
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'FHB',
            name: 'Fulda-Hanauer Bahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 0, 40],
            coordinates: %w[G20 J15],
            color: '#37383a',
          },
          {
            float_percent: 50,
            sym: 'WLB',
            name: 'Waldeck\'sche Landesbahn',
            logo: '1889/AR',
            simple_logo: '1889/AR.alt',
            tokens: [0, 40, 100],
            coordinates: 'C14',
            color: '#37383a',
          },
        ].freeze
      end
    end
  end
end
