# គម្រោងកម្មវិធី Flutter BLoC API

គម្រោងនេះបង្ហាញពីកម្មវិធី Flutter ដែលមានរចនាសម្ព័ន្ធដោយប្រើ **BLoC Architecture** និង **API integration**។ វាប្រើការរចនាជាប្រព័ន្ធស្អាត (clean architecture) ដើម្បីបែងចែកស្រទាប់អោយបានច្បាស់ រួមមាន `data`, `domain`, `presentation`, និង `core`។

## រចនាសម្ព័ន្ធគម្រោង

```bash
lib/
├── core/                  # base classes, utils, constants
│   ├── constants/
│   └── utils/
├── data/                  # data sources, models, API service, repository implementations
│   ├── models/
│   ├── repositories/
│   └── services/
├── domain/                # business logic, interfaces, use cases
│   ├── repositories/
│   └── usecases/
├── presentation/          # UI, BLoC, pages
│   ├── bloc/
│   └── pages/
└── main.dart              # ចំណុចចាប់ផ្ដើម
```




### **ថ្នាក់ `core/`**

ថ្នាក់ `core/` មាន utility classes និង constants ដែលអាចប្រើបាននៅគ្រប់កន្លែងនៃគម្រោង។ វាអាចរួមមាន:
- **Utils**: ដូចជា error handling, JSON parsing, ល...
- **Constants**: ជា constants នៃកម្មវិធី ដូចជា API base URL, colors, fonts...

**ឧទាហរណ៍**:

```bash
lib/core/
├── constants/
│   ├── api_constants.dart   # មាន base URLs, API keys...
│   └── app_colors.dart      # ការកំណត់ colors នៃកម្មវិធី...
└── utils/
    ├── error_handler.dart   # ការប្រើប្រាស់ error handling...
    └── json_parser.dart     # Utility សម្រាប់ JSON parsing...
```



### **ថ្នាក់ `data/`**

ថ្នាក់នេះគឺទាក់ទងនឹងទិន្នន័យ API, models, និង repository implementations ។ វាអាចរួមមាន:
- **Models**: ធ្វើការ serialize/deserialize ទិន្នន័យ JSON (JSON -> Object, Object -> JSON)
- **API Service**: មាន logic សម្រាប់ធ្វើការ request ទៅកាន់ API។
- **Repository Implementations**: ធ្វើការ implement repository interface ដែលបានកំណត់នៅក្នុង domain layer ។

**ឧទាហរណ៍**:

```bash
lib/data/
├── models/
│   └── post.dart            # Post model class
├── repositories/
│   └── post_repository_impl.dart  # Implementation នៃ PostRepository
└── services/
    └── api_service.dart     # API service សម្រាប់ fetch posts
```


### **ថ្នាក់ `domain/`**


ថ្នាក់នេះគឺផ្ទុក **business logic** ឬ **application logic** ដែលមិនមានការទាក់ទងនឹង UI ឬ data fetching ដោយផ្ទាល់។ វាអាចរួមមាន:
- **Repositories (Interfaces)**: កំណត់ contract សម្រាប់ធ្វើការក្នុង data layer។
- **Use Cases**: ប្រើ logic ដែលត្រូវការក្នុងកម្មវិធី (e.g., fetch posts, delete posts)។

**ឧទាហរណ៍**:

```bash
lib/domain/
├── repositories/
│   └── post_repository.dart  # PostRepository interface
└── usecases/
    └── get_posts.dart        # Use case សម្រាប់ fetch posts
```



### **ថ្នាក់ `presentation/`**

ថ្នាក់នេះទាក់ទងនឹង UI និង state management ដែលប្រើ **BLoC**។ វារួមមាន:
- **BLoC**: Classes សម្រាប់គ្រប់គ្រង state និង event
- **Pages**: UI pages សម្រាប់បង្ហាញទិន្នន័យ

**ឧទាហរណ៍**:

```bash
lib/presentation/
├── bloc/
│   ├── post_bloc.dart    # BLoC សម្រាប់ post feature
│   ├── post_event.dart   # Events សម្រាប់ PostBloc
│   └── post_state.dart   # States សម្រាប់ PostBloc
└── pages/
    └── post_page.dart    # UI page សម្រាប់បង្ហាញ posts
```



### **main.dart**

ឯកសារ `main.dart` គឺជាចំណុចចាប់ផ្ដើមនៃកម្មវិធី ដែលធ្វើការកំណត់ចេញ UI និង state management (BlocProviders, routes...)។

## របៀបដំណើរការគម្រោង

1. **Clone repository**:
   ```bash
   git clone https://github.com/ThearyCoding/flutter_bloc_api.git
   cd flutter_bloc_api
   ```


