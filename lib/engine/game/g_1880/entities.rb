# frozen_string_literal: true

module Engine
  module Game
    module G1880
      module Entities
        COMPANIES = [
          {
            name: 'Woosong Railway',
            sym: 'P0',
            value: 5,
            revenue: 0,
            desc: 'Owner recieves one-off payment of 40/70/100 when last 2+2/3/3+3 train is purchased',
            color: nil,
          },
          {
            name: 'Kaiping Railway',
            sym: 'P1',
            value: 10,
            revenue: 5,
            desc: 'No Special Power',
            color: nil,
          },
          {
            name: 'Yanda Ferry Company',
            sym: 'P2',
            value: 25,
            revenue: 10,
            desc: 'The owner may use all ferries for free with all his companies',
            color: nil,
          },
          {
            name: 'Taiwan Western Line',
            sym: 'P3',
            value: 45,
            revenue: 15,
            desc: 'For the owner, the value of Taiwan is +20 (with all his companies)',
            color: nil,
          },
          {
            name: 'Chinese Rivers Ferry Companies',
            sym: 'P4',
            value: 70,
            revenue: 20,
            desc: 'Reduce the cost of laying a tile in a river hex by ¥20 (for all his companies)',
            color: nil,
          },
          {
            name: 'Jeme Tien Yow Engineer Office',
            sym: 'P5',
            value: 100,
            revenue: 25,
            desc: 'Building permit for Phase D (for one of his companies)',
            color: nil,
          },
          {
            name: 'Imperial Qing Government',
            sym: 'P6',
            value: 160,
            revenue: 0,
            desc: 'The owner receives the 20% Director’s Certificates of the BCR, BCR may always lay 2 yellow tiles',
            color: nil,
          },
          {
            name: 'Rocket of China',
            sym: 'P7',
            value: 50,
            revenue: 0,
            desc: 'The owner may exchange the Rocket of China for a currently available train, '\
                  'for one of his companies, during that company’s turn in an Operating Round. '\
                  'Forced exchange into second 4-train.',
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            float_percent: 20,
            sym: 'JHA',
            logo: '1880/JHA',
            city: 2,
            name: 'Jingha Railway',
            tokens: [0, 40, 100],
            coordinates: 'F8',
            color: '#BA6128',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'JHU',
            city: 3,
            name: 'Jinghu Railway',
            logo: '1880/JHU',
            tokens: [0, 40, 100],
            coordinates: 'F8',
            color: 'black',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'JGG',
            city: 0,
            name: 'Jingguang Railway',
            logo: '1880/JGG',
            tokens: [0, 40, 100],
            coordinates: 'F8',
            color: '#534074',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'JLR',
            city: 1,
            name: 'Jinglan Railway',
            logo: '1880/JLR',
            tokens: [0, 40, 100],
            coordinates: 'F8',
            color: '#008A8B',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'BCU',
            name: 'Binzhou Railway',
            logo: '1880/BCU',
            tokens: [0, 40, 100],
            coordinates: 'B8',
            color: '#9D8359',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'LHR',
            name: 'Longhai Railway',
            logo: '1880/LHR',
            tokens: [0, 40, 100],
            coordinates: 'J2',
            color: '#004294',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'SCR',
            name: 'Schichang Railway',
            logo: '1880/SCR',
            tokens: [0, 40, 100],
            coordinates: 'N12',
            color: '#282F1A',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'CKR',
            name: 'Chengkun Railway',
            logo: '1880/CKR',
            tokens: [0, 40, 100],
            coordinates: 'O5',
            color: '#507EAE',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'BCR',
            name: 'Baocheng Railway',
            logo: '1880/BCR',
            tokens: [0, 40, 100],
            coordinates: 'M3',
            color: '#94121D',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'NXR',
            name: 'Ningxi Railway',
            logo: '1880/NXR',
            tokens: [0, 40, 100],
            coordinates: 'J6',
            color: '#A83B5B',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'HKR',
            name: 'Hukun Railway',
            logo: '1880/HKR',
            tokens: [0, 40, 100],
            coordinates: 'K15',
            color: '#40743A',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'NJR',
            name: 'Nanjiang Railway',
            logo: '1880/NJR',
            tokens: [0, 40, 100],
            coordinates: 'K13',
            color: '#452518',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'QSR',
            name: 'Qinshen Railway',
            logo: '1880/QSR',
            tokens: [0, 40, 100],
            coordinates: 'D12',
            color: '#B3932C',
            max_ownership_percent: 100,
            always_market_price: true,
          },
          {
            float_percent: 20,
            sym: 'WNR',
            name: 'Wunan Railway',
            logo: '1880/WNR',
            tokens: [0, 40, 100],
            coordinates: 'L10',
            color: '#A4391F',
            max_ownership_percent: 100,
            always_market_price: true,
          },
        ].freeze

        MINORS = [
          {
            sym: 'A1',
            name: 'Russian Investor',
            logo: '1880/Russia',
            tokens: [0],
            coordinates: 'A3',
            color: :gray,
            text_color: 'black',
          },
          {
            sym: 'A2',
            name: 'Japanese Investor',
            logo: '1880/Japan',
            tokens: [0],
            coordinates: 'E13',
            color: :gray,
            text_color: 'black',
          },
          {
            sym: 'A3',
            name: 'Belgian Investor',
            logo: '1880/Belgium',
            tokens: [0],
            coordinates: 'H6',
            color: :gray,
            text_color: 'black',
          },
          {
            sym: 'A4',
            name: 'German Investor',
            logo: '1880/Germany',
            tokens: [0],
            coordinates: 'H14',
            color: :gray,
            text_color: 'black',
          },
          {
            sym: 'A5',
            name: 'British Investor',
            logo: '1880/UK',
            tokens: [0],
            coordinates: 'Q15',
            color: :gray,
            text_color: 'black',
          },
          {
            sym: 'A6',
            name: 'Portuguese Investor',
            logo: '1880/Portugal',
            tokens: [0],
            coordinates: 'P12',
            color: :gray,
            text_color: 'black',
          },
          {
            sym: 'A7',
            name: 'French Investor',
            logo: '1880/France',
            tokens: [0],
            coordinates: 'Q7',
            color: :gray,
            text_color: 'black',
          },
        ].freeze
      end
    end
  end
end
