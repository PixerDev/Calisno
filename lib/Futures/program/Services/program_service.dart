import 'package:flutter_sport_app_1/Futures/program/Model/program_model.dart';

class ProgramService {
  List<List<List<ProgramModel>>> getprograms() {
    List<List<List<ProgramModel>>> categores = [
      [
        [
          ProgramModel(name: 'شنای معمولی سه ست 12'),
          ProgramModel(name: 'کرانچ در حد توان'),
          ProgramModel(name: 'دیپ با صندلی  سه ست 10'),
          ProgramModel(name: 'چین آپ سه ست 5')
        ],
        [
          ProgramModel(name: 'اسکات سه ست 14'),
          ProgramModel(name: 'لانگ سه ست 15'),
          ProgramModel(name: 'لانگ پرشی سه ست 7'),
          ProgramModel(name: 'اسکات پرشی سه ست 10')
        ],
        [
          ProgramModel(name: 'شنای معمولی سه ست 12'),
          ProgramModel(name: 'شنای شیب منفی سه ست 8'),
          ProgramModel(name: 'دیپ با صندلی سه ست 10'),
          ProgramModel(name: 'شنای سرشانه سه ست 7')
        ],
        [
          ProgramModel(name: 'پول اپ سه ست 5'),
          ProgramModel(name: 'چین اپ سه ست 5'),
          ProgramModel(name: 'شراگ سه ست 12'),
          ProgramModel(name: 'حرکت سوچر من سه ست 12')
        ]
      ],
      [
        [
          ProgramModel(name: 'شنای معمولی سه ست 14'),
          ProgramModel(name: 'شنای الماسی سه ست 12'),
          ProgramModel(name: 'کرانچ دوچرخه در حد توان'),
          ProgramModel(name: 'چین اپ منفی سه ست 6'),
          ProgramModel(name: 'جلو بازو  چهار ست 12')
        ],
        [
          ProgramModel(name: 'اسکات سه ست15'),
          ProgramModel(name: 'لانگ سه ست 20'),
          ProgramModel(name: 'لانگ پرشی سه ست 17'),
          ProgramModel(name: 'اسکان بلغاری سه ست 12'),
          ProgramModel(name: 'حرکت صندلی در حد توان')
        ],
        [
          ProgramModel(name: 'شنای دست باز ست 14'),
          ProgramModel(name: 'شنای سرشنانه سه ست 10'),
          ProgramModel(name: 'دیپ سه ست 20')
        ],
        [ProgramModel(name: 'بالانس در حد توان'), ProgramModel(name: '')]
      ],
      [
        [
          ProgramModel(name: 'شنای دست منفی شش ست 8'),
          ProgramModel(name: 'چین اپ سه ست 25'),
          ProgramModel(name: 'چین اپ منفی چنج ست 7'),
          ProgramModel(name: 'پول اپ چهار ست 8'),
          ProgramModel(name: 'چین اپ منفی چهار ست 6')
        ],
        [
          ProgramModel(name: 'سکات چهار ست 15'),
          ProgramModel(name: 'لانگ چهار ست 20'),
          ProgramModel(name: 'اسکات پرشی چهار ست 15'),
        ],
        [
          ProgramModel(name: 'شنای معمولی چهار ست 15'),
          ProgramModel(name: 'شنای منفی چهار ست 18'),
          ProgramModel(name: 'بالانس با دیوار در حد توان'),
        ],
        [
          ProgramModel(name: 'کرانچ دوچرخه 5ست در حد توان'),
          ProgramModel(name: 'چین اپ منفی چهار ست 10')
        ]
      ]
    ];
    return categores;
  }
}
