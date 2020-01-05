# OneTimeCodeTester
Sample code that shows iOS bug [FB7500516](https://feedbackassistant.apple.com/feedback/7500516).

**TLDR:** The one time code is not parsed correctly if text message contains emoji.

### Summary 
I have a UITextField with its content-type set to "One Time Code". If I receive a SMS with a confirmation code, it is magically handled by iOS and an option to prefill this code appears above the keyboard.
e.g. this text works: "Your confirmation code is: 1234"

In Messages.app the 1234 also appears underlined so you can easily copy it.

However, if the text contains emoji, it is not handled by the system and no option to prefill appears.
e.g. "Your confirmation code 🎉 is: 5678"

In Messages.app the 5678 does not appear underlined either.
