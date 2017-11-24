//
//  ViewController.m
//  语音播报
//
//  Created by digitalforest on 2017/11/24.
//  Copyright © 2017年 digitalforest. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@interface ViewController ()<AVSpeechSynthesizerDelegate>
// 合成器 控制播放，暂停
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
// 实例化说话的语言，说中文、英文
@property (nonatomic, strong) AVSpeechSynthesisVoice *voice;
@property (nonatomic, strong) AVSpeechUtterance *utterance;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.utterance = [AVSpeechUtterance speechUtteranceWithString:@"床前明月光，疑是地上霜。"];
    self.utterance.voice = _voice;
    self.utterance.rate = 0.6;
    [self.playButton setTitle:@"PLAY" forState:UIControlStateNormal];
    [self.playButton setTitle:@"STOP" forState:UIControlStateSelected];
}

- (AVSpeechSynthesisVoice *)voice{
    if (!_voice) {
        _voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
    }
    return _voice;
}

- (AVSpeechSynthesizer*)synthesizer{
    if (!_synthesizer) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAction:(UIButton*)sender {
    if (![sender isSelected]) {
        [self.synthesizer speakUtterance:_utterance];
    }
    else{
        if ([self.synthesizer isSpeaking]) {
            [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        }
    }
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    [self.playButton setSelected:YES];
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    [self.playButton setSelected:NO];
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance{
    
}

@end
