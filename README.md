README: DTCloudUserDefaults
---------------------------

The NSUbiquitousKeyStore documentation states that you should not use it as the key data source, and that there should also be a local version.
DTCloudUserDefaults does this. Use it instead of NSUserDefaults for anything you want to also be stored in iCloud, and shared with other versions of your app for example. 


_USAGE_

in applicationDidFinishLaunching, you should also call [DTCloudUserDefaults sychronize]; and [DTCloudUserDefaults registerForNotifications]; to ensure the key store is up to date and remains as such.
On applicationWillClose you should call
[DTCloudUserDefaults sychronize]; and [DTCloudUserDefaults removeNotifications]; 

If using the array storage methods, you should ensure that any objects that will be stored inside the array conform to the initWithCoder and encodeWithCoder, otherwise it will not work. Also, it automatically uses NSKeyedArchiver and Unarchiver, there is no need to do this yourself.

License
-------
_TL;DR;_

1. You can use the code in your own products.
2. You can modify the code as you wish, and use the modified code in your products.
3. You can redistribute the original, unmodified code, but you have to include the full license text below.
3. You can redistribute the modified code as you wish (without the full license text below).
3. In all cases, you must include a credit mentioning Danielle Lancashire as the original author of the source, for example: INCLUDES "DTCloudUserDefaults" by <a href="http://meetendocrimes.co.uk">Danielle Lancashire</a>
3. I’m not liable for anything you do with the code, no matter what. So be sensible.
3. You can’t use my name or other marks to promote your products based on the code.
3. If you agree to all of that, go ahead and download the source. Otherwise, don’t.


_Full License_

This software is supplied to you by Danielle Lancashire in consideration of your agreement to the following terms, and your use, installation, modification or redistribution of this software constitutes acceptance of these terms. If you do not agree with these terms, please do not use, install, modify or redistribute this software.

In consideration of your agreement to abide by the following terms, and subject to these terms, Danielle Lancashire grants you a personal, non-exclusive license, to use, reproduce, modify and redistribute the software, with or without modifications, in source and/or binary forms; provided that if you redistribute the software in its entirety and without modifications, you must retain this notice and the following text and disclaimers in all such redistributions of the software, and that in all cases attribution of Danielle Lancashire as the original author of the source code shall be included in all such resulting software products or distributions. Neither the name, trademarks, service marks or logos of Danielle Lancashire may be used to endorse or promote products derived from the software without specific prior written permission from Danielle Lancashire. Except as expressly stated in this notice, no other rights or licenses, express or implied, are granted by Danielle Lancashire herein, including but not limited to any patent rights that may be infringed by your derivative works or by other works in which the software may be incorporated.

The software is provided by Danielle Lancashire on an "AS IS" basis. Danielle Lancashire MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL Danielle Lancashire BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF Danielle Lancashire HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
