import 'package:prettyrini/feature/admin/manage_progress/model/progress_mode.dart';

class ProgressData {
  static List<UserProgress> getUserProgressList() {
    return [
      UserProgress(
        id: '1',
        name: 'Wade Warren',
        profileImage: 'https://i.pravatar.cc/150?img=11',
        progressStatus: 'Up 5%',
        progressPercentage: 75.0,
        isProgressUp: true,
      ),
      UserProgress(
        id: '2',
        name: 'Esther Howard',
        profileImage: 'https://i.pravatar.cc/150?img=1',
        progressStatus: 'Less 2%',
        progressPercentage: 45.0,
        isProgressUp: false,
      ),
      UserProgress(
        id: '3',
        name: 'Jenny Wilson',
        profileImage: 'https://i.pravatar.cc/150?img=12',
        progressStatus: 'Up 5%',
        progressPercentage: 80.0,
        isProgressUp: true,
      ),
      UserProgress(
        id: '4',
        name: 'Annette Black',
        profileImage: 'https://i.pravatar.cc/150?img=13',
        progressStatus: 'Less 2%',
        progressPercentage: 35.0,
        isProgressUp: false,
      ),
      UserProgress(
        id: '5',
        name: 'Jacob Jones',
        profileImage: 'https://i.pravatar.cc/150?img=14',
        progressStatus: 'Less 2%',
        progressPercentage: 40.0,
        isProgressUp: false,
      ),
      UserProgress(
        id: '6',
        name: 'Darlene Robertson',
        profileImage: 'https://i.pravatar.cc/150?img=15',
        progressStatus: 'Up 5%',
        progressPercentage: 85.0,
        isProgressUp: true,
      ),
      UserProgress(
        id: '7',
        name: 'Robert Fox',
        profileImage: 'https://i.pravatar.cc/150?img=16',
        progressStatus: 'Less 2%',
        progressPercentage: 30.0,
        isProgressUp: false,
      ),
    ];
  }
}