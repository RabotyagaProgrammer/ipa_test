
// ViewController.m
#import "ViewController.h"
#import "MyFunctions.h"

@interface ViewController ()

// Декларации кнопок и текстового поля
@property (nonatomic, strong) UIButton *callCFunctionButton;
@property (nonatomic, strong) UIButton *anotherButton;
@property (nonatomic, strong) UIButton *stackOverflowButton;
@property (nonatomic, strong) UIButton *heapOverflowButton;
@property (nonatomic, strong) UIButton *integerOverflowButton;
@property (nonatomic, strong) UITextField *inputTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Установка фона
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Настройка первой кнопки, которая вызывает функцию на C
    self.callCFunctionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.callCFunctionButton setTitle:@"Call C Function" forState:UIControlStateNormal];
    [self.callCFunctionButton addTarget:self
                                 action:@selector(callCFunction)
                       forControlEvents:UIControlEventTouchUpInside];
    self.callCFunctionButton.frame = CGRectMake(100, 200, 200, 50);
    [self.view addSubview:self.callCFunctionButton];
    
    // Настройка второй кнопки с другим действием
    self.anotherButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.anotherButton setTitle:@"Another Action" forState:UIControlStateNormal];
    [self.anotherButton addTarget:self
                           action:@selector(anotherAction)
                 forControlEvents:UIControlEventTouchUpInside];
    self.anotherButton.frame = CGRectMake(100, 300, 200, 50);
    [self.view addSubview:self.anotherButton];
    
    // Настройка кнопки для Stack Overflow
    self.stackOverflowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.stackOverflowButton setTitle:@"Stack Overflow" forState:UIControlStateNormal];
    [self.stackOverflowButton addTarget:self
                                 action:@selector(stackOverflow)
                       forControlEvents:UIControlEventTouchUpInside];
    self.stackOverflowButton.frame = CGRectMake(100, 400, 200, 50);
    [self.view addSubview:self.stackOverflowButton];
    
    // Настройка кнопки для Heap Overflow
    self.heapOverflowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.heapOverflowButton setTitle:@"Heap Overflow" forState:UIControlStateNormal];
    [self.heapOverflowButton addTarget:self
                                action:@selector(heapOverflow)
                      forControlEvents:UIControlEventTouchUpInside];
    self.heapOverflowButton.frame = CGRectMake(100, 500, 200, 50);
    [self.view addSubview:self.heapOverflowButton];
    
    // Настройка кнопки для Integer Overflow
    self.integerOverflowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.integerOverflowButton setTitle:@"Integer Overflow" forState:UIControlStateNormal];
    [self.integerOverflowButton addTarget:self
                                   action:@selector(integerOverflow)
                         forControlEvents:UIControlEventTouchUpInside];
    self.integerOverflowButton.frame = CGRectMake(100, 600, 200, 50);
    [self.view addSubview:self.integerOverflowButton];
    
    // Настройка текстового поля для ввода строки
    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputTextField.placeholder = @"Enter text here";
    [self.view addSubview:self.inputTextField];
}

// Метод для вызова функции на C
- (void)callCFunction {
    myCFunction(); // Вызов функции на C
}

// Метод для второго действия
- (void)anotherAction {
    NSLog(@"Another button tapped!");
    NSString *inputText = self.inputTextField.text;
    [self saveInputText:inputText]; // Сохранение введенного текста
}

// Метод для Stack Overflow
- (void)stackOverflow {
    NSString *inputText = self.inputTextField.text;
    myStackOverflowFunction([inputText UTF8String]); // Вызов функции с Stack Overflow
}
// Метод для Heap Overflow
- (void)heapOverflow {
    NSString *inputText = self.inputTextField.text;
    myHeapOverflowFunction([inputText UTF8String]); // Вызов функции с Heap Overflow
}

// Метод для Integer Overflow
- (void)integerOverflow {
    NSString *inputText = self.inputTextField.text;
    myIntegerOverflowFunction([inputText UTF8String]); // Вызов функции с Integer Overflow
}

// Метод для сохранения введенного текста
- (void)saveInputText:(NSString *)text {
    // Здесь можно добавить код для сохранения текста, например, в UserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:text forKey:@"savedText"];
    [defaults synchronize];
    
    NSLog(@"Input text saved: %@", text);
}

@end
